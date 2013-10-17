//
//  StreamPlayer.m
//  VideoStreaming
//
//  Created by Subins P Jose on 15/10/13.
//  Copyright (c) 2013 QBurst. All rights reserved.
//

#import "StreamPlayer.h"
#import <MediaPlayer/MediaPlayer.h>

@interface StreamPlayer ()
{
    MPMoviePlayerController *player;
    UIActivityIndicatorView* activityIndicator ;
}

@end

@implementation StreamPlayer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}

-(void)createActivityIndicator
{
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    CGFloat x = self.frame.size.width / 2;
    CGFloat y = self.frame.size.height / 2;
    
    activityIndicator.center = CGPointMake(x, y);
    [activityIndicator startAnimating];
    [self addSubview:activityIndicator];
}

-(void)removeActivityIndicator
{
    if(nil != activityIndicator)
    {
        [activityIndicator stopAnimating];
        [activityIndicator release];
        activityIndicator = nil;
    }
}

-(void)createMoviePlayer:(NSURL*)url
{
    player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [[player view] setHidden:YES];
    [player prepareToPlay];
    [[player view] setFrame:[self bounds]];
    [self addSubview:[player view]];
    [player play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playbackStateChanged)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
}

-(void)playVideo:(NSURL*)url
{
    [self removeActivityIndicator];
    [self createActivityIndicator];
    [self releasePlayer];
    [self createMoviePlayer:url];
}

-(void)playbackStateChanged
{
    if(nil != player && player.playbackState == MPMoviePlaybackStatePlaying)
    {
        [[player view] setHidden:NO];
        [self removeActivityIndicator];
    }
}

-(void)releasePlayer
{
    if(nil != player)
    {
        [player release];
        player = nil;
    }
}

-(void)dealloc
{
    [self releasePlayer];
    [self removeActivityIndicator];
    [super dealloc];
}

@end
