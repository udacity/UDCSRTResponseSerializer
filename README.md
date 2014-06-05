# UDCSRTResponseSerializer

UDCSRTResponseSerializer is response serializer you can plug in to AFNetworking that parses an SRT file and returns it in a friendly format.

## Usage

```obj-c
AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
sessionManager.responseSerializer = [UDCSRTResponseSerializer serializer];
NSString *path = videoTranscriptURL.absoluteString;
[sessionManager GET:path
         parameters:nil
            success:^(NSURLSessionDataTask *task, id responseObject) {
                NSLog(@"We now have a UDCVideoTranscript! %@", responseObject);
            } failure:nil];
```

## Todo

* Write unit tests

## Installation

UDCSRTResponseSerializer is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile: pod "UDCSRTResponseSerializer"

## Author

Oliver Cameron, olivercameron@icloud.com

## License

Test is available under the Unlicense license. See the LICENSE file for more info.

## Credit

Credit for the SRT parsing technique goes to [MPMoviePlayerController-Subtitles](https://github.com/mhergon/MPMoviePlayerController-Subtitles).