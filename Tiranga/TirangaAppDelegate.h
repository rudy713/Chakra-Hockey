//
//  TirangaAppDelegate.h
//  Tiranga
//
//  Created by Rudy Pospisil on 03/04/12.
//  Copyright (c) 2012 rudypospisil@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>	//needed for SystemSoundID
@class View;
@class ViewController;

@interface TirangaAppDelegate : UIResponder <UIApplicationDelegate> {
	SystemSoundID sid;
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
