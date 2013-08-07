//
//  ITBackButton.m
//
//  Created by Tiago Alves on 8/5/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import "ITBackButton.h"
#import "ITShapes.h"
#import "UIView+JMNoise.h"

@implementation ITBackButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.6] forState:UIControlStateHighlighted];
        [self setTitleShadowColor:[UIColor colorWithWhite:0 alpha:0.4] forState:UIControlStateNormal];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        self.titleLabel.shadowOffset = CGSizeMake(0, -1);
        self.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        
        // Defaults
        self.addNoise = TRUE;
        
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
        self.borderColor = [UIColor colorWithRed:0.15f green:0.15f blue:0.17f alpha:0.7];
    }
    if (!self.topColor) {
        self.topColor = [UIColor colorWithRed:0.31f green:0.32f blue:0.34f alpha:1.00f];
    }
    if (!self.bottomColor) {
        self.bottomColor = [UIColor colorWithRed:0.17f green:0.18f blue:0.20f alpha:1.00f];
    }
    if (!self.innerGlow) {
        self.innerGlow = [UIColor colorWithWhite:0.5 alpha:0.4];
    }
    
    // Dimensions Declarations
    if (!self.arrowWidth) {
        self.arrowWidth = 10.0f;
    }
    if (!self.radius) {
        self.radius = 5.0f;
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
    
    // Draw rounded back arrow bezier path
    UIBezierPath *roundedRectanglePath = [ITShapes bezierPathForBackButtonInRect:rect withRoundingRadius:self.radius andArrowWidth:self.arrowWidth];
    // Use the bezier as a clipping path
    [roundedRectanglePath addClip];
    
    // Use one of the two gradients depending on the state of the button
    CGGradientRef background = self.highlighted? highlightedGradient : gradient;
    
    // Draw gradient within the path
    CGContextDrawLinearGradient(context, background, CGPointMake(rect.size.width/2, 0), CGPointMake(rect.size.width/2, rect.size.height), 0);
    
    if (self.addNoise) {
        [self drawCGNoiseWithOpacity:0.1];
    }
    
    // Draw Inner Glow
    UIBezierPath *innerGlowRect = [ITShapes bezierPathForInnerGlowBackButtonInRect:rect withRoundingRadius:self.radius andArrowWidth:self.arrowWidth];
    [self.innerGlow setStroke];
    innerGlowRect.lineWidth = 1;
    [innerGlowRect stroke];
    
    // Draw border
    [self.borderColor setStroke];
    roundedRectanglePath.lineWidth = self.borderWidth ? self.borderWidth : 2.5;
    [roundedRectanglePath stroke];
    
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
