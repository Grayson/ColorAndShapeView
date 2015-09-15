//
//  ShapeView.h
//  ColorAndShapeControl
//
//  Created by Grayson Hansard on 9/15/15.
//  Copyright © 2015 From Concentrate Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSUInteger, ShapeViewShapeMask)
{
	Diamond,
	Triangle,
	Circle,
	Square,
};

extern NSString * __nonnull const ShapeViewShapeKeyPath;
extern NSString * __nonnull const ShapeViewColorKeyPath;
extern NSString * __nonnull const ShapeViewInsetKeyPath;

IB_DESIGNABLE
@interface ShapeView : NSView

@property (nonatomic, assign) IBInspectable ShapeViewShapeMask shape;
@property (nonatomic, strong, nonnull) IBInspectable NSColor *color;
@property (nonatomic, assign) IBInspectable NSSize inset;

@end
