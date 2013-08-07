//
//  ITShapes.h
//
//  Created by Tiago Alves on 8/7/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITShapes : NSObject

+ (UIBezierPath *) bezierPathForBackButtonInRect:(CGRect)rect withRoundingRadius:(CGFloat)radius andArrowWidth:(CGFloat)arrowWidth;
+ (UIBezierPath *) bezierPathForInnerGlowBackButtonInRect:(CGRect)rect withRoundingRadius:(CGFloat)radius andArrowWidth:(CGFloat)arrowWidth;

@end
