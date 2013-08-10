//
//  ITMainButton.m
//
//  Created by Tiago Alves on 8/5/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import "ITMainButton.h"

@implementation ITMainButton

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
    // General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Color Declarations
    if (!self.borderColor) {
        self.borderColor = [UIColor colorWithRed:0.20f green:0.21f blue:0.23f alpha:1.00f];
    }
    if (!self.topColor) {
        self.topColor = [UIColor colorWithRed:0.32f green:0.33f blue:0.35f alpha:1.00f];
    }
    if (!self.bottomColor) {
        self.bottomColor = [UIColor colorWithRed:0.16f green:0.17f blue:0.19f alpha:1.00f];
    }
    if (!self.innerGlow) {
        self.innerGlow = [UIColor clearColor];
    }
    
    // Dimensions Declarations
    if (!self.radius) {
        self.radius = 4.0f;
    }
    if (!self.borderWidth) {
        self.borderWidth = 2;
    }
    
    // Gradient Declarations
    NSArray *gradientColors = (@[
                               (id)self.topColor.CGColor,
                               (id)self.bottomColor.CGColor
                               ]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(gradientColors), NULL);
    
    NSArray *highlightedGradientColors = (@[
                                          (id)self.bottomColor.CGColor,
                                          (id)self.topColor.CGColor
                                          ]);
    
    CGGradientRef highlightedGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(highlightedGradientColors), NULL);
    
    // Draw rounded rectangle bezier path
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: self.radius];
    // Use the bezier as a clipping path
    [roundedRectanglePath addClip];
    
    // Use one of the two gradients depending on the state of the button
    CGGradientRef background = self.highlighted? highlightedGradient : gradient;
    
    // Draw gradient within the path
    CGContextDrawLinearGradient(context, background, CGPointMake(rect.size.width/2, 0), CGPointMake(rect.size.width/2, rect.size.height), 0);
    
    // Draw border
    [self.borderColor setStroke];
    roundedRectanglePath.lineWidth = self.borderWidth;
    [roundedRectanglePath stroke];
    
    // Draw Inner Glow
    UIBezierPath *innerGlowRect = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1.5, 1.5, rect.size.width-3, rect.size.height-3) cornerRadius: self.radius - 1.5];
    [self.innerGlow setStroke];
    innerGlowRect.lineWidth = 1;
    [innerGlowRect stroke];
    
    // Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(highlightedGradient);
    CGColorSpaceRelease(colorSpace);
}

- (void)setHighlighted:(BOOL)highlighted
{
    [self setNeedsDisplay];
    [super setHighlighted:highlighted];
}

@end
