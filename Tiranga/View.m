//
//  View.m
//  Tiranga
//
//  Created by Rudy Pospisil on 03/04/12.
//  Copyright (c) 2012 rudypospisil@gmail.com. All rights reserved.
//

#import "View.h"
#import "TirangaPuck.h"
#include "ViewController.h"

@implementation View

- (id) initWithFrame: (CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        //setup puck.
        int imageWidth = 95;
        CGFloat x = self.bounds.size.width/2 - imageWidth/2;
        CGFloat y = self.bounds.size.height/2 - imageWidth/2;
        CGRect f = CGRectMake(x, y, 95, 95);
        tirangaPuck = [[TirangaPuck alloc] initWithFrame: f];
        [self addSubview: tirangaPuck];
        tirangaPuck.backgroundColor = [UIColor clearColor];
        dx = 4;
		dy = 4;
    }
    NSBundle *bundle = [NSBundle mainBundle];
	NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);	
    NSString *filename = [bundle pathForResource: @"Bounce" ofType: @"mp3"];
	NSLog(@"filename == \"%@\"", filename);
	NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
	NSLog(@"url == \"%@\"", url);    
	OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
	}

    return self;
}

- (void) bounce {	
	//Where the ball would be if its horizontal motion were allowed
	//to continue for one more move.
	CGRect horizontal = tirangaPuck.frame;
	horizontal.origin.x += dx;
	
	//Where the ball would be if its vertical motion were allowed
	//to continue for one more move.
	CGRect vertical = tirangaPuck.frame;
	vertical.origin.y += dy;
	
	//Ball must remain inside self.bounds.
	if (!CGRectEqualToRect(horizontal, CGRectIntersection(horizontal, self.bounds))) {
        AudioServicesPlaySystemSound(sid);
		//Ball will bounce off left or right edge of View.
		dx = -dx;
	}	
	if (!CGRectEqualToRect(vertical, CGRectIntersection(vertical, self.bounds))) {
        AudioServicesPlaySystemSound(sid);
		//Ball will bounce off top or bottom edge of View.
		dy = -dy;
	}	
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	tirangaPuck.center = CGPointMake(tirangaPuck.center.x + dx, tirangaPuck.center.y + dy);
    self.window.rootViewController = [[ViewController alloc] initWithNibName: nil bundle: nil];
[self bounce];
}

- (void) move: (CADisplayLink *) displayLink {
	tirangaPuck.center = CGPointMake(tirangaPuck.center.x + dx, tirangaPuck.center.y + dy);
	[self bounce];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //just to see coord, dim
    NSLog(@"self.frame == (%g, %g), %g × %g",
      self.frame.origin.x,
          self.frame.origin.y,
          self.frame.size.width,
          self.frame.size.height
          );
    NSLog(@"self.bounds == (%g, %g), %g × %g",
          self.bounds.origin.x,
          self.bounds.origin.y,
          self.bounds.size.width,
          self.bounds.size.height
          );
    
    //set up the tricolor.
    //white set using background colour.
    //other 2 colors sit on top.
    CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
    CGContextRef c = UIGraphicsGetCurrentContext();    
    //saffron orange
    CGContextAddRect(c, CGRectMake( 0 * w / 3, 0, w / 3, h));
    CGContextSetRGBFillColor(c, 0.95, 0.55, 0.18, 1.0);
	CGContextFillPath(c);
    //green
    CGContextAddRect(c, CGRectMake( ((w / 3) * 2), 0, w / 3, h));
    CGContextSetRGBFillColor(c, 0.00, 0.51, 0.31, 1.0);
	CGContextFillPath(c);
    
    //this is the ashok chakra. layers on top of previous solid circle.
    UIImage *image = [UIImage imageNamed: @"logo_indiaFlag.png"];  //95px^2
    if (image == nil) {
        NSLog(@"could not find the image");
        return;
    }    
    
    //using upper left corner of image, center image.
    CGPoint point = CGPointMake(
                                (w - image.size.width) / 2,
                                (h - image.size.height) / 2
                                );
    
    [image drawAtPoint: point];
    
    UIFont *font = [UIFont systemFontOfSize: 36];
    // [@"BHARAT" drawAtPoint: CGPointZero withFont: font];
    //taking a break. Will return soon.
    NSString *string = @"भारत";
    //need to change this to generic.
    CGPoint point2 = CGPointMake( w / 2 - 36, h * .7 );
    [string drawAtPoint: point2 withFont: font];
}

@end
