//
//  AppDelegate.h
//  ColorAndShapeControl
//
//  Created by Grayson Hansard on 9/15/15.
//  Copyright © 2015 From Concentrate Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShapeView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, assign) IBOutlet ShapeView *shapeView;

- (IBAction)changeShape:(id)sender;

@end

