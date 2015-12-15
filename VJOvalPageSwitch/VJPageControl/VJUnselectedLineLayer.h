//
//  VJUnselectedLineLayer.h
//  VJOvalPageSwtichTProject
//
//  Created by Vincent on 15/12/15.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface VJUnselectedLineLayer : CALayer
@property(nonatomic, strong) UIColor *circleColor;
@property(nonatomic, strong) UIColor *circleBorderColor;
@property(nonatomic, assign) CGFloat circleBorderWidth;

@property(nonatomic, assign) CGSize unselectedOvalLayerSize;
@property(nonatomic, assign) NSInteger pageNumber;
@property(nonatomic, assign) CGRect currentRect;

@end
