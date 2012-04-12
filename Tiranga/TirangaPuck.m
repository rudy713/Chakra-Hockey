//
//  TirangaPuck.m
//  Tiranga
//
//  Created by Rudy Pospisil on 04/04/12.
//  Copyright (c) 2012 rudypospisil@gmail.com. All rights reserved.
//

#import "TirangaPuck.h"

@implementation TirangaPuck

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //this is the movable chakra.
    UIImage *image = [UIImage imageNamed: @"logo_anahataChakra.png"];  //95px^2
    if (image == nil) {
    NSLog(@"could not find the image");
    return;
    }    
    
    //using upper left corner of image, center image.
    CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;

    CGPoint point = CGPointMake(
    (w - image.size.width) / 2,
    (h - image.size.height) / 2
    );
 
    [image drawAtPoint: point];
}

@end
