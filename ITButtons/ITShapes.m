//
//  ITShapes.m
//
//  Created by Tiago Alves on 8/7/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import "ITShapes.h"

@implementation ITShapes

+ (UIBezierPath *) bezierPathForBackButtonInRect:(CGRect)rect withRoundingRadius:(CGFloat)radius andArrowWidth:(CGFloat)arrowWidth {
    if (!arrowWidth) {
        arrowWidth = 10.0f;
    }
    CGFloat angle = atan2f(CGRectGetMidY(rect) - rect.origin.y, arrowWidth);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint mPoint = CGPointMake(CGRectGetMaxX(rect) - radius, rect.origin.y);
    CGPoint ctrlPoint = mPoint;
    [path moveToPoint:mPoint];
    
    ctrlPoint.y += radius;
    mPoint.x += radius;
    mPoint.y += radius;
    if (radius > 0) [path addArcWithCenter:ctrlPoint radius:radius startAngle:M_PI + M_PI_2 endAngle:0 clockwise:YES];
    
    mPoint.y = CGRectGetMaxY(rect) - radius;
    [path addLineToPoint:mPoint];
    
    ctrlPoint = mPoint;
    mPoint.y += radius;
    mPoint.x -= radius;
    ctrlPoint.x -= radius;
    if (radius > 0) [path addArcWithCenter:ctrlPoint radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    
    mPoint.x = rect.origin.x + arrowWidth + (radius);
    [path addLineToPoint:mPoint];
    
    ctrlPoint = CGPointMake(mPoint.x, CGRectGetMaxY(rect) - radius);
    if (radius > 0) [path addArcWithCenter:ctrlPoint radius:radius startAngle:M_PI_2 endAngle:M_PI_2+angle clockwise:YES];
    
    [path addLineToPoint:CGPointMake(rect.origin.x, CGRectGetMidY(rect))];
    
    ctrlPoint = CGPointMake(rect.origin.x + arrowWidth + radius, rect.origin.y + radius);
    if (radius > 0) [path addArcWithCenter:ctrlPoint radius:radius startAngle:M_PI + angle endAngle:M_PI+M_PI_2 clockwise:YES];
    
    [path closePath];
    return path;
}

+ (UIBezierPath *) bezierPathForInnerGlowBackButtonInRect:(CGRect)rect withRoundingRadius:(CGFloat)radius andArrowWidth:(CGFloat)arrowWidth {
    CGFloat innerGlowOffset = 2.0f;
    if (!arrowWidth) {
        arrowWidth = 10.0f;
    }
    CGFloat angle = atan2f(CGRectGetMidY(rect) - rect.origin.y, arrowWidth);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(rect.origin.x + innerGlowOffset, CGRectGetMidY(rect))];
    
    CGPoint ctrlPoint = CGPointMake(rect.origin.x + arrowWidth + radius, rect.origin.y + radius + innerGlowOffset);
    if (radius > 0) [path addArcWithCenter:ctrlPoint radius:radius startAngle:M_PI + angle endAngle:M_PI+M_PI_2 clockwise:YES];
    
    CGPoint mPoint = CGPointMake(CGRectGetMaxX(rect) - radius - innerGlowOffset, rect.origin.y + innerGlowOffset);
    mPoint.x = CGRectGetMaxX(rect) - radius;
    [path addLineToPoint:mPoint];
    
    ctrlPoint = mPoint;
    ctrlPoint.y += radius;
    if (radius > 0) [path addArcWithCenter:ctrlPoint radius:radius startAngle:M_PI + M_PI_2 endAngle:0 clockwise:YES];
    
    return path;
}

@end
