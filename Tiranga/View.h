//
//  View.h
//  Tiranga
//
//  Created by Rudy Pospisil on 03/04/12.
//  Copyright (c) 2012 rudypospisil@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID

@class TirangaPuck;

@interface View: UIView {
    //TirangaPuck *tirangaPuck;
    UIView *tirangaPuck;
    CGFloat dx, dy;	//direction and speed of puck's motion
    SystemSoundID sid;
}

- (void) move: (CADisplayLink *) displayLink;

@end