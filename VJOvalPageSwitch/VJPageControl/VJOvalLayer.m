//
//  VJOvalShapeLayer.m
//  VJOvalPageSwtichTProject
//
//  Created by Vincent on 15/12/14.
//  Copyright © 2015年 Vincent. All rights reserved.
//

#import "VJOvalLayer.h"

@implementation VJOvalLayer{

}
@dynamic currentRect;
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
//        return  YES;
    }else if ([key isEqualToString:@"currentRect"]){
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"currentRect"] && self.animationOfMoving)
    {
        CABasicAnimation *anim = self.animationOfMoving;
        anim.fromValue = [self.presentationLayer valueForKey:key];

        anim.fillMode = kCAFillModeForwards;
        anim.removedOnCompletion = YES;
        return anim;
    }
    return [super actionForKey:key];
}
- (void)drawInContext:(CGContextRef)ctx{
    CGRect currentRect = [self.presentationLayer currentRect];
    CGFloat offset = currentRect.size.width / 3.6;
    
    CGPoint rectCenter = CGPointMake(currentRect.origin.x + currentRect.size.width/2 ,
                                     currentRect.origin.y + currentRect.size.height/2);
    
    CGFloat extra = 0;//(self.currentRect.size.width * 2 / 5) * _sliderProgress;
    
    CGPoint pointUp = CGPointMake(rectCenter.x, currentRect.origin.y + extra);
    CGPoint pointRight = CGPointMake(rectCenter.x + currentRect.size.width/2 + extra * 2, rectCenter.y);
    CGPoint pointDown = CGPointMake(rectCenter.x, rectCenter.y + currentRect.size.height/2 - extra);
    CGPoint pointLeft = CGPointMake(currentRect.origin.x - extra * 2, rectCenter.y);
    
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
- (void)display{
    NSLog(@"%@",[NSValue valueWithCGRect: [self.presentationLayer currentRect]]);
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawInContext:ctx];
//    [self drawInContext:ctx];
    
    self.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();
}
- (void)moveToRect:(CGRect)rect fromRect:(CGRect)fromRect{
//    CASpringAnimation *anim = [CASpringAnimation animationWithKeyPath:@"currentRect"];
//    anim.damping = 20;
//    anim.initialVelocity = 20;
//    anim.fromValue = [NSValue valueWithCGRect:fromRect];
//    anim.duration = anim.settlingDuration;
//    
//    anim.fillMode = kCAFillModeForwards;
//    anim.removedOnCompletion = NO;
//    [self addAnimation:anim forKey:@"restoreAnimation"];
    
    self.currentRect = rect;
    
    [self setNeedsDisplay];
}


@end
