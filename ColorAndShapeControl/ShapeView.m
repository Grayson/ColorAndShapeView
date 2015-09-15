//
//  ShapeView.m
//  ColorAndShapeControl
//
//  Created by Grayson Hansard on 9/15/15.
//  Copyright © 2015 From Concentrate Software. All rights reserved.
//

#import "ShapeView.h"
#import "NSBezierPath+Shapes.h"

NSString * const ShapeViewShapeKeyPath = @"shape";
NSString * const ShapeViewColorKeyPath = @"color";
NSString * const ShapeViewInsetKeyPath = @"inset";

@interface ShapeView()
{
	ShapeViewShapeMask _shape;
	NSColor *_color;
}
@end

@implementation ShapeView

+ (void)initialize
{
	if (self != [ShapeView class])
		return;

	[[self class] exposeBinding:ShapeViewShapeKeyPath];
	[[self class] exposeBinding:ShapeViewColorKeyPath];
	[[self class] exposeBinding:ShapeViewInsetKeyPath];
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
	self = [super initWithFrame:frameRect];
	_color = [NSColor blackColor];
	return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	_color = [NSColor blackColor];
	return self;
}

- (ShapeViewShapeMask)shape
{
	return _shape;
}

- (void)setShape:(ShapeViewShapeMask)shape
{
	_shape = shape;
	[self setNeedsDisplay:YES];
}

- (NSColor *)color
{
	return _color;
}

- (void)setColor:(NSColor *)color
{
	_color = color;
	[self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
	[self.color set];
	NSRect rect = NSInsetRect(self.bounds, self.inset.width, self.inset.height);
	switch (self.shape)
	{
		case Circle:
			[[NSBezierPath bezierPathWithCircleInRect:rect] fill];
			break;
		case Square:
			[[NSBezierPath bezierPathWithSquareInRect:rect] fill];
			break;
		case Triangle:
			[[NSBezierPath bezierPathWithTriangleInRect:rect] fill];
			break;
		case Diamond:
			[[NSBezierPath bezierPathWithDiamondInRect:rect] fill];
			break;
			
	}
}

@end
