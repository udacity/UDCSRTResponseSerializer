//
//  UDCSRTResponseSerializer.m
//  Created by Oliver Cameron on 5/28/14.
//

#import "UDCSRTResponseSerializer.h"

#import "UDCVideoTranscript.h"

NSString *const UDCSRTRegularExpressionPattern = @"[<|\\{][^>|\\^}]*[>|\\}]";

@implementation UDCSRTResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    NSString *contents = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // Adapted from "MPMoviePlayerController-Subtitles" by "mhergon"
    // https://github.com/mhergon/MPMoviePlayerController-Subtitles
    NSScanner *scanner = [NSScanner scannerWithString:contents];
    NSMutableArray *parts = [NSMutableArray new];
    while (!scanner.isAtEnd) {
        NSCharacterSet *newlineCharacterSet = [NSCharacterSet newlineCharacterSet];
        NSCharacterSet *whitespaceCharacterSet = [NSCharacterSet whitespaceCharacterSet];
        
        // Fetch the SRT index
        NSString *index = nil;
        [scanner scanUpToCharactersFromSet:newlineCharacterSet
                                intoString:&index];
        
        // Fetch the start interval
        NSString *startTime = nil;
        [scanner scanUpToString:@" --> " intoString:&startTime];
        [scanner scanString:@"-->" intoString:NULL];
        
        // Fetch the end interval
        NSString *endTime = nil;
        [scanner scanUpToCharactersFromSet:newlineCharacterSet
                                intoString:&endTime];
        
        // Convert the intervals from an NSString to NSTimeInterval
        NSTimeInterval start = [self timeIntervalFromSRTTimeString:startTime];
        NSTimeInterval end = [self timeIntervalFromSRTTimeString:endTime];
        
        // Fetch the text
        NSError *error = nil;
        NSString *text = nil;
        [scanner scanUpToString:@"\r\n\r\n" intoString:&text];
        text = [text stringByTrimmingCharactersInSet:whitespaceCharacterSet];
        if (!text) {
            text = @"";
        }
        
        NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:UDCSRTRegularExpressionPattern
                                                                                           options:NSRegularExpressionCaseInsensitive
                                                                                             error:&error];
        text = [regularExpression stringByReplacingMatchesInString:text
                                                           options:0
                                                             range:NSMakeRange(0, text.length)
                                                      withTemplate:@""];
        
        // Add the part to our transcript
        if (!error) {
            UDCVideoTranscriptPart *videoTranscriptPart = [UDCVideoTranscriptPart new];
            videoTranscriptPart.index = index;
            videoTranscriptPart.start = start;
            videoTranscriptPart.end = end;
            videoTranscriptPart.text = text;
            [parts addObject:videoTranscriptPart];
        }
    }
    
    UDCVideoTranscript *videoTranscript = [UDCVideoTranscript new];
    videoTranscript.parts = [parts copy];
    return videoTranscript;
}

- (NSTimeInterval)timeIntervalFromSRTTimeString:(NSString *)timeString {
    NSScanner *scanner = [NSScanner scannerWithString:timeString];
    NSInteger hours, minutes, seconds, milliseconds;
    [scanner scanInteger:&hours];
    [scanner scanString:@":" intoString:NULL];
    [scanner scanInteger:&minutes];
    [scanner scanString:@":" intoString:NULL];
    [scanner scanInteger:&seconds];
    [scanner scanString:@"," intoString:NULL];
    [scanner scanInteger:&milliseconds];
    return (hours * 3600.0) + (minutes * 60.0) + seconds + (milliseconds / 1000.0);
}

@end
