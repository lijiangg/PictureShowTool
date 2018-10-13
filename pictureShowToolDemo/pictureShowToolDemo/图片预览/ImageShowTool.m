//
//  ImageShowTool.m
//  b-link
//
//  Created by 李李江 on 2018/10/12.
//  Copyright © 2018年 Yan Geng. All rights reserved.
//

#import "ImageShowTool.h"
#import "ImageShowView.h"
#import "UIView+Frame.h"
#import <UIImageView+WebCache.h>
#define showView_tag 33355533322
@implementation ImageShowTool

+ (void)showImageWithImagePath:(NSString *)ImagePath placeholderImageName:(NSString *)placeholderImageName isWebCache:(BOOL)isWebCache{
    ImageShowView *showView = [[UIApplication sharedApplication].keyWindow viewWithTag:showView_tag];
    if (!showView) {
        showView = [ImageShowView showView];
        showView.frame = [UIApplication sharedApplication].keyWindow.bounds;
        showView.tag = showView_tag;
        [[UIApplication sharedApplication].keyWindow addSubview:showView];
    }
    if (isWebCache) {
        [showView.mainImageView sd_setImageWithURL:[NSURL URLWithString:ImagePath] placeholderImage:[UIImage imageNamed:placeholderImageName]];
        
    }else{
        showView.mainImageView.image = [UIImage imageNamed:placeholderImageName];
    }
    
    
    __weak ImageShowView *weakShowView = showView;
    __weak typeof(self) weakSelf = self;
    showView.drag = ^(UIPanGestureRecognizer *panGesture) {
        UIView *view = panGesture.view;
        if (panGesture.state == UIGestureRecognizerStateBegan || panGesture.state == UIGestureRecognizerStateChanged) {
            CGPoint translation = [panGesture translationInView:view.superview];
            [view setCenter:CGPointMake(view.centerX+translation.x, view.centerY+translation.y)];
            [panGesture setTranslation:CGPointZero inView:view.superview];
        }
    };
    showView.pin = ^(UIPinchGestureRecognizer *pinGesture) {
        if (pinGesture.state == UIGestureRecognizerStateEnded) {
            weakShowView.currentScale = pinGesture.scale;
        }else if(pinGesture.state == UIGestureRecognizerStateBegan && weakShowView.currentScale != 0.0f){
            pinGesture.scale = weakShowView.currentScale;
        }
        
        if (pinGesture.scale !=NAN && pinGesture.scale != 0.0) {
            weakShowView.mainImageView.transform = CGAffineTransformMakeScale(pinGesture.scale, pinGesture.scale);
        }
    };
    showView.close = ^(UIButton *sender) {
        [weakSelf dismissImageView];
    };
    
    showView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.3 animations:^{
        showView.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
}
+ (void)dismissImageView{
    ImageShowView *showView = [[UIApplication sharedApplication].keyWindow viewWithTag:showView_tag];
    if (showView) {
        [UIView animateWithDuration:0.3 animations:^{
            showView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        }completion:^(BOOL finished) {
            if (finished) {
                [showView removeFromSuperview];
            }
        }];
    }
}

@end
