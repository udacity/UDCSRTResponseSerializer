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