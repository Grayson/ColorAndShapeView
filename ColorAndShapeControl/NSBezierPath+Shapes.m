//
//  NSBezierPath+Shapes.m
//  ColorAndShapeControl
//
//  Created by Grayson Hansard on 9/15/15.
//  Copyright © 2015 From Concentrate Software. All rights reserved.
//

#import "NSBezierPath+Shapes.h"

void TriangleComponentsThatFitInRect(NSRect rect, CGFloat *side, CGFloat *height, CGFloat *midX, CGFloat *midY)
{
	*side = MIN(NSWidth(rect), NSHeight(rect));
	*height = sqrt(3.0) / 2.0 * (*side);
	*midX = NSMidX(NSInsetRect(rect, NSWidth(rect) - *side, *height));
	*midY = NSMidY(NSInsetRect(rect, NSWidth(rect) - *side, *height));
}

@implementation NSBezierPath (Shapes)

+ (instancetype)bezierPathWithCircleInRect:(NSRect)rect
{
	CGFloat diameter = MIN(NSWidth(rect), NSHeight(rect));
	return [NSBezierPath bezierPathWithOvalInRect:NSMakeRect( (NSWidth(rect) - diameter) / 2.0, (NSHeight(rect) - diameter) / 2.0, diameter, diameter)];
}

+ (instancetype)bezierPathWithSquareInRect:(NSRect)rect
{
	CGFloat side = MIN(NSWidth(rect), NSHeight(rect));
	return [NSBezierPath bezierPathWithRect:NSMakeRect( (NSWidth(rect) - side) / 2.0, (NSHeight(rect) - side) / 2.0, side, side)];
}

+ (instancetype)bezierPathWithTriangleInRect:(NSRect)rect
{
	CGFloat side;
	CGFloat height;
	CGFloat midX;
	CGFloat midY;
	
	TriangleComponentsThatFitInRect(rect, &side, &height, &midX, &midY);

	CGFloat halfSide = side / 2.0;
	CGFloat halfHeight = height / 2.0;
	
	NSBezierPath *path = [NSBezierPath bezierPath];
	[path moveToPoint:NSMakePoint(midX - halfSide, midY - halfHeight)];
	[path lineToPoint:NSMakePoint(midX, midY + halfHeight)];
	[path lineToPoint:NSMakePoint(midX + halfSide, midY - halfHeight)];
	[path lineToPoint:NSMakePoint(midX - halfSide, midY - halfHeight)];
	[path closePath];
	[path fill];
	return path;
}

+ (instancetype)bezierPathWithDiamondInRect:(NSRect)rect
{
	CGFloat side;
	CGFloat height;
	CGFloat midX;
	CGFloat midY;
	
	TriangleComponentsThatFitInRect(rect, &side, &height, &midX, &midY);
	
	CGFloat halfSide = side / 2.0;
	CGFloat halfHeight = height / 2.0;
	
	NSBezierPath *path = [NSBezierPath bezierPath];
	[path moveToPoint:NSMakePoint(midX - halfSide, midY)];
	[path lineToPoint:NSMakePoint(midX, midY + halfHeight)];
	[path lineToPoint:NSMakePoint(midX + halfSide, midY)];
	[path lineToPoint:NSMakePoint(midX, midY - halfHeight)];
	[path lineToPoint:NSMakePoint(midX - halfSide, midY)];
	[path closePath];
	[path fill];
	return path;

	return [NSBezierPath bezierPath];
}

@end
