//
//  NSBezierPath+Shapes.h
//  ColorAndShapeControl
//
//  Created by Grayson Hansard on 9/15/15.
//  Copyright © 2015 From Concentrate Software. All rights reserved.
//

@import AppKit;

@interface NSBezierPath (Shapes)

+ (instancetype)bezierPathWithCircleInRect:(NSRect)rect;
+ (instancetype)bezierPathWithSquareInRect:(NSRect)rect;
+ (instancetype)bezierPathWithTriangleInRect:(NSRect)rect;
+ (instancetype)bezierPathWithDiamondInRect:(NSRect)rect;

@end
