//
//  UITextField+DashedBorder.m
//  PH-Log
//
//  Created by dev on 6/20/13.
//  Copyright (c) 2013 catalyze.io. All rights reserved.
//

#import "UnderlineUITextField.h"
#import <QuartzCore/QuartzCore.h>

#define dotRadius 2

@implementation UnderlineUITextField
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAShapeLayer *shapelayer = [[CAShapeLayer alloc] init];
    [self.layer addSublayer:shapelayer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    //draw a line
    [path moveToPoint:CGPointMake(0, self.frame.size.height-1)]; //add yourStartPoint here
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height-1)];// add yourEndPoint here
    [path stroke];
}

@end
