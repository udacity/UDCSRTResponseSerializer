//
//  UDCVideoTranscript.h
//  Created by Oliver Cameron on 5/30/14.
//

@interface UDCVideoTranscript : NSObject

@property (nonatomic, copy) NSArray *parts;

@end

@interface UDCVideoTranscriptPart : NSObject

@property (nonatomic, copy) NSString *index;
@property (nonatomic, assign) NSTimeInterval start;
@property (nonatomic, assign) NSTimeInterval end;
@property (nonatomic, copy) NSString *text;

@end
