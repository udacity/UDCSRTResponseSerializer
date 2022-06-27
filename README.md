# Archival Note
This repository is deprecated; therefore, we are going to archive it.
However, learners will be able to fork it to their personal Github account but cannot submit PRs to this repository. If you have any issues or suggestions to make, feel free to:
- Utilize the https://knowledge.udacity.com/ forum to seek help on content-specific issues.
- Submit a support ticket along with the link to your forked repository if (learners are) blocked for other reasons. Here are the links for the [retail consumers](https://udacity.zendesk.com/hc/en-us/requests/new) and [enterprise learners](https://udacityenterprise.zendesk.com/hc/en-us/requests/new?ticket_form_id=360000279131).

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
