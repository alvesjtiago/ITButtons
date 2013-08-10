//
//  ITMainButton.h
//
//  Created by Tiago Alves on 8/5/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITMainButton : UIButton

// Colors
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *topColor;
@property (nonatomic, strong) UIColor *bottomColor;
@property (nonatomic, strong) UIColor *innerGlow;

// Dimensions
@property (nonatomic) CGFloat radius;
@property (nonatomic) CGFloat borderWidth;

// Noise
@property (nonatomic) BOOL addNoise;

@end
