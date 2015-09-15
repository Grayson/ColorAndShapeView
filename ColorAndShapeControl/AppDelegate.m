//
//  AppDelegate.m
//  ColorAndShapeControl
//
//  Created by Grayson Hansard on 9/15/15.
//  Copyright © 2015 From Concentrate Software. All rights reserved.
//

#import "AppDelegate.h"
#import "ShapeView.h"
#import "NSBezierPath+Shapes.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)awakeFromNib
{
}

- (IBAction)changeShape:(id)sender
{
	NSUInteger tag = [[sender selectedCell] tag];
	self.shapeView.shape = tag;
}

@end
