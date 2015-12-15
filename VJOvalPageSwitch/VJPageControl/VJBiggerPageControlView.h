//
//  VJBiggerPageControlView.h
//  VJOvalPageSwtichTProject
//
//  Created by Vincent on 15/12/15.
//  Copyright © 2015年 Vincent. All rights reserved.
//
@protocol  VJBiggerPageControlViewDelegate;

#import <UIKit/UIKit.h>
#import "VJOvalLayer.h"
#import "VJUnselectedLineLayer.h"

@interface VJBiggerPageControlView : UIView

@property (weak, nonatomic) UIScrollView *bindScrollView;

@property (weak, nonatomic) id<VJBiggerPageControlViewDelegate> delegate;

@property (assign, nonatomic) NSInteger selectedPageIndex;
@property (assign, nonatomic) NSInteger pageNumber;
@property (assign, nonatomic) CGFloat pageControlMarginX;
@property (assign, nonatomic) CGSize currentOvalSize;
@property (readonly,strong) VJOvalLayer *pageCircleLayer;
-(void)animateToIndex:(NSInteger)index;
-(void)configPageOvalLayer;
@end

@protocol VJBiggerPageControlViewDelegate <NSObject>

@optional
- (void)didSelectedPageCircleAtIndex: (NSInteger) pageIndex;
@end