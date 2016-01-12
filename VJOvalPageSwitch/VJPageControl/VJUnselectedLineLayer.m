//
//  VJUnselectedLineLayer.m
//  VJOvalPageSwtichTProject
//
//  Created by Vincent on 15/12/15.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "VJUnselectedLineLayer.h"

@implementation VJUnselectedLineLayer
-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(instancetype)initWithLayer:(VJUnselectedLineLayer *)layer{
    self = [super initWithLayer:layer];
    if (self) {
        self.circleColor = layer.circleColor;
        self.circleBorderColor = layer.circleBorderColor;
        
        self.unselectedOvalLayerSize = layer.unselectedOvalLayerSize;
        self.pageNumber = layer.pageNumber;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx{
    
    CGFloat widthPerPage = self.currentRect.size.width/self.pageNumber;
//    CGFloat offset = self.unselectedOvalLayerSize.width / 3.6;
//    UIGraphicsBeginImageContextWithOptions
    for (NSInteger pageIndex = 0; pageIndex < self.pageNumber; pageIndex ++) {
        CGFloat ovalOriginX = widthPerPage * pageIndex + self.currentRect.origin.x + (widthPerPage-self.unselectedOvalLayerSize.width)/2;
        CGFloat ovalOriginY = self.currentRect.origin.y ;
        
        CGPoint rectCenter = CGPointMake(ovalOriginX + self.unselectedOvalLayerSize.width/2 ,
                                         ovalOriginY + self.currentRect.size.height/2);
        
//        CGPoint pointUp = CGPointMake(rectCenter.x, rectCenter.y - self.unselectedOvalLayerSize.height/2);
//        CGPoint pointRight = CGPointMake(rectCenter.x + self.unselectedOvalLayerSize.width/2, rectCenter.y);
//        CGPoint pointDown = CGPointMake(rectCenter.x, rectCenter.y + self.unselectedOvalLayerSize.height/2);
//        CGPoint pointLeft = CGPointMake(ovalOriginX, rectCenter.y);
//        
//        CGPoint c1 = CGPointMake(pointUp.x + offset, pointUp.y);
//        CGPoint c2 = CGPointMake(pointRight.x, pointRight.y - offset);
//        
//        CGPoint c3 = CGPointMake(pointRight.x, pointRight.y + offset);
//        CGPoint c4 = CGPointMake(pointDown.x + offset, pointDown.y);
//        
//        CGPoint c5 = CGPointMake(pointDown.x - offset, pointDown.y);
//        CGPoint c6 = CGPointMake(pointLeft.x, pointLeft.y + offset);
//        
//        CGPoint c7 = CGPointMake(pointLeft.x, pointLeft.y - offset);
//        CGPoint c8 = CGPointMake(pointUp.x - offset, pointUp.y);
        
//        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
        CAShapeLayer *circle = [CAShapeLayer layer];
        // Make a circular shape
        circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(ovalOriginX, rectCenter.y - self.unselectedOvalLayerSize.height/2, self.unselectedOvalLayerSize.height, self.unselectedOvalLayerSize.width)
                                                 cornerRadius:self.unselectedOvalLayerSize.width].CGPath;
        // Center the shape in self.view
        circle.position = rectCenter;
//        [ovalPath moveToPoint: pointUp];
//        [ovalPath addCurveToPoint:pointRight controlPoint1:c1 controlPoint2:c2];
//        [ovalPath addCurveToPoint:pointDown controlPoint1:c3 controlPoint2:c4];
//        [ovalPath addCurveToPoint:pointLeft controlPoint1:c5 controlPoint2:c6];
//        [ovalPath addCurveToPoint:pointUp controlPoint1:c7 controlPoint2:c8];
//        
//        [ovalPath closePath];
        CGContextAddPath(ctx, circle.path);
        
    }
    CGContextSetLineWidth(ctx, self.circleBorderWidth);
    CGContextSetStrokeColorWithColor(ctx, self.circleBorderColor.CGColor);
    CGContextStrokePath(ctx);
    CGContextSetFillColorWithColor(ctx, self.circleColor.CGColor);
    CGContextFillPath(ctx);
    
}
@end
