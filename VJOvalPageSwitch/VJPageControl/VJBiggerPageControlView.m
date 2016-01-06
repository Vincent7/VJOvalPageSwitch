//
//  VJBiggerPageControlView.m
//  VJOvalPageSwtichTProject
//
//  Created by Vincent on 15/12/15.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "VJBiggerPageControlView.h"
@interface VJBiggerPageControlView ()
@property (nonatomic, strong) VJOvalLayer *currentPageOvalLayer;
@property (nonatomic, strong) VJUnselectedLineLayer *unselectedLineLayer;
@end
@implementation VJBiggerPageControlView

-(VJOvalLayer *)currentPageOvalLayer{
    if (!_currentPageOvalLayer) {
        _currentPageOvalLayer = [VJOvalLayer layer];
        _currentPageOvalLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _currentPageOvalLayer.circleColor = [UIColor colorWithWhite:1 alpha:.5];
        [_currentPageOvalLayer setContentsScale:[[UIScreen mainScreen] scale]];
    }
//    [_currentPageOvalLayer restoreAnimation];
    return _currentPageOvalLayer;
}

-(VJUnselectedLineLayer *)unselectedLineLayer{
    if (!_unselectedLineLayer) {
        _unselectedLineLayer = [VJUnselectedLineLayer layer];
        _unselectedLineLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _unselectedLineLayer.circleColor = [UIColor clearColor];
        _unselectedLineLayer.circleBorderColor = [UIColor colorWithWhite:1 alpha:.4];
        _unselectedLineLayer.circleBorderWidth = 1;
        _unselectedLineLayer.pageNumber = self.pageNumber;
        _unselectedLineLayer.unselectedOvalLayerSize = self.currentOvalSize;
        [_unselectedLineLayer setContentsScale:[[UIScreen mainScreen] scale]];
    }
    return _unselectedLineLayer;
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//        [self addGestureRecognizer:tap];
//        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
//        [self addGestureRecognizer:pan];
//        
//        self.layer.masksToBounds = NO;
    }
    return self;
}

- (void)configPageOvalLayer{
    self.unselectedLineLayer.currentRect = CGRectMake(self.pageControlMarginX,
                                                      0,
                                                      self.bounds.size.width - 2 * self.pageControlMarginX,
                                                      self.bounds.size.height);
    [self.layer addSublayer:self.unselectedLineLayer];
    [self.layer insertSublayer:self.currentPageOvalLayer above:self.unselectedLineLayer];

    [self.unselectedLineLayer setNeedsDisplay];
}
- (void)moveToPageIndex:(NSInteger)pageIndex fromIndex:(NSInteger)fromIndex{
    
    CGFloat unitDistance = (self.bounds.size.width - self.pageControlMarginX * 2)/self.pageNumber;
//    [self.currentPageOvalLayer performSelector:@selector(restoreAnimation) withObject:nil afterDelay:0.0];
    [self.currentPageOvalLayer moveToRect:CGRectMake(self.pageControlMarginX + pageIndex * unitDistance + (unitDistance - self.currentOvalSize.width)/2,
                                                     (self.bounds.size.height - self.currentOvalSize.height)/2,
                                                     self.currentOvalSize.width,
                                                     self.currentOvalSize.height)
                                 fromRect:CGRectMake(self.pageControlMarginX + fromIndex * unitDistance + (unitDistance - self.currentOvalSize.width)/2,
                                                     (self.bounds.size.height - self.currentOvalSize.height)/2,
                                                     self.currentOvalSize.width,
                                                     self.currentOvalSize.height)];
    
}
-(void)animateToIndex:(NSInteger)index{
    NSInteger tempLastIndex = _selectedPageIndex;
    self.selectedPageIndex = index;
    [self moveToPageIndex:index fromIndex:tempLastIndex];
}

-(void)tapAction:(UITapGestureRecognizer *)gesture{
    
}

-(void)panAction:(UIPanGestureRecognizer *)pan {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
