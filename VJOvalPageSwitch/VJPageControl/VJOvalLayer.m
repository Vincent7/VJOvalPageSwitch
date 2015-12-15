//
//  VJOvalShapeLayer.m
//  VJOvalPageSwtichTProject
//
//  Created by Vincent on 15/12/14.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "VJOvalLayer.h"

@implementation VJOvalLayer

#pragma mark -- Initialize
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(instancetype)initWithLayer:(VJOvalLayer *)layer{
    self = [super initWithLayer:layer];
    if (self) {
        self.currentRect = layer.currentRect;
        self.circleColor = layer.circleColor;

        self.sliderProgress = layer.sliderProgress;
    }
    return self;
}
+(BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqual:@"sliderProgress"]) {
        return  YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx{
    
    CGFloat offset = self.currentRect.size.width / 3.6;
    
    CGPoint rectCenter = CGPointMake(self.currentRect.origin.x + self.currentRect.size.width/2 ,
                                     self.currentRect.origin.y + self.currentRect.size.height/2);
    
    CGPoint pointUp = CGPointMake(rectCenter.x, self.currentRect.origin.y);
    CGPoint pointRight = CGPointMake(rectCenter.x + self.currentRect.size.width/2, rectCenter.y);
    CGPoint pointDown = CGPointMake(rectCenter.x, rectCenter.y + self.currentRect.size.height/2);
    CGPoint pointLeft = CGPointMake(self.currentRect.origin.x, rectCenter.y);
    
    CGPoint c1 = CGPointMake(pointUp.x + offset, pointUp.y);
    CGPoint c2 = CGPointMake(pointRight.x, pointRight.y - offset);
    
    CGPoint c3 = CGPointMake(pointRight.x, pointRight.y + offset);
    CGPoint c4 = CGPointMake(pointDown.x + offset, pointDown.y);
    
    CGPoint c5 = CGPointMake(pointDown.x - offset, pointDown.y);
    CGPoint c6 = CGPointMake(pointLeft.x, pointLeft.y + offset);
    
    CGPoint c7 = CGPointMake(pointLeft.x, pointLeft.y - offset);
    CGPoint c8 = CGPointMake(pointUp.x - offset, pointUp.y);
    
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    
    [ovalPath moveToPoint: pointUp];
    [ovalPath addCurveToPoint:pointRight controlPoint1:c1 controlPoint2:c2];
    [ovalPath addCurveToPoint:pointDown controlPoint1:c3 controlPoint2:c4];
    [ovalPath addCurveToPoint:pointLeft controlPoint1:c5 controlPoint2:c6];
    [ovalPath addCurveToPoint:pointUp controlPoint1:c7 controlPoint2:c8];
    
    [ovalPath closePath];
    
    CGContextAddPath(ctx, ovalPath.CGPath);
    CGContextSetFillColorWithColor(ctx, self.circleColor.CGColor);
    CGContextFillPath(ctx);
}

- (void)moveToRect:(CGRect)rect{
    self.currentRect = rect;
    [self setNeedsDisplay];
}
@end
