//
//  VJOvalShapeLayer.h
//  VJOvalPageSwtichTProject
//
//  Created by Vincent on 15/12/14.
//  Copyright © 2015年 Vincent. All rights reserved.
//

//typedef enum ScrollDirection {
//    ScrollDirectionNone,
//    ScrollDirectionUp,
//    ScrollDirectionDown,
//    ScrollDirectionLeft,
//    ScrollDirectionRight,
//    ScrollDirectionFuckingCrazy,
//} ScrollDirection;
#define  DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface VJOvalLayer : CALayer
@property(nonatomic, assign)CGRect currentRect;
@property(nonatomic, strong)UIColor *circleColor;

@property(nonatomic, assign) CGFloat sliderProgress;
@property(nonatomic, strong) CABasicAnimation *animationOfMoving;
- (void)moveToRect:(CGRect)rect fromRect:(CGRect)fromRect;
//- (void)restoreAnimation;
@end
