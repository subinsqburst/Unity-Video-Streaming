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
}

@end

@implementation StreamPlayer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)playVideo:(NSURL*)url
{
    [self releasePlayer];
    
    player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [player prepareToPlay];
    [[player view] setFrame:[self bounds]];
    [self addSubview:[player view]];
    [player play];
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
    [super dealloc];
}

@end
