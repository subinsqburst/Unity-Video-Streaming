#import "StreamPlayer.h"
#import "iPhone_View.h"

extern "C"
{
    void playVideo(char* url)
    {
        StreamPlayer *streamPlayer = [[StreamPlayer alloc] initWithFrame:CGRectMake(10,200,300,250)];
        [streamPlayer playVideo:[NSURL URLWithString:[NSString stringWithUTF8String:url]]];
        
        [[UIApplication sharedApplication].keyWindow addSubview:streamPlayer];
        
        UIViewController* unityView = UnityGetGLViewController();
        [unityView.view addSubview:streamPlayer];
    }
}