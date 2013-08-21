//
//  ITBackButton.h
//
//  Created by Tiago Alves on 8/5/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITBackButton : UIButton

// Colors
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *topColor;
@property (nonatomic, strong) UIColor *bottomColor;
@property (nonatomic, strong) UIColor *innerGlow;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *titleColorHighlighted;
@property (nonatomic, strong) UIColor *titleShadowColor;
@property (nonatomic, strong) UIColor *titleShadowColorHighlighted;

// Dimensions
@property (nonatomic) CGFloat radius;
@property (nonatomic) CGFloat arrowWidth;
@property (nonatomic) CGFloat borderWidth;

// Noise
@property (nonatomic) BOOL addNoise;

@end
