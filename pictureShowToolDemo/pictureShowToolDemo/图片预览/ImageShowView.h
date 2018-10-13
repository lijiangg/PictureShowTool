//
//  ImageShowView.h
//  b-link
//
//  Created by 李李江 on 2018/10/12.
//  Copyright © 2018年 Yan Geng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageShowView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGesture;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;

@property (assign, nonatomic) CGFloat currentScale;

@property (copy, nonatomic) void(^pin)(UIPinchGestureRecognizer *pinGesture);
@property (copy, nonatomic) void(^drag)(UIPanGestureRecognizer *panGesture);

@property (copy, nonatomic) void(^close)(UIButton *sender);
+ (instancetype)showView;
@end
