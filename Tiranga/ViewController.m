//
//  ViewController.m
//  Tiranga
//
//  Created by Rudy Pospisil on 12/04/12.
//  Copyright (c) 2012 rudypospisil@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@implementation ViewController

- (void) didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
    
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: frame];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad
{
	[super viewDidLoad];
    
	displayLink = [CADisplayLink displayLinkWithTarget: self.view
      selector: @selector(move:)];
    
	//Call move: every time the display is refreshed.
	displayLink.frameInterval = 1;
    
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink addToRunLoop: loop forMode: NSDefaultRunLoopMode];
}


- (void) viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
/*

	// Return YES for supported orientations
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
*/
}

- (void) dealloc {
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink removeFromRunLoop: loop forMode: NSDefaultRunLoopMode];
}

@end
