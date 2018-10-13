//
//  ImageShowView.m
//  b-link
//
//  Created by 李李江 on 2018/10/12.
//  Copyright © 2018年 Yan Geng. All rights reserved.
//

#import "ImageShowView.h"

@implementation ImageShowView{
    CGFloat currentScale;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)showView{
    return [[UINib nibWithNibName:@"ImageShowView" bundle:nil]instantiateWithOwner:nil options:nil].firstObject;
}
- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    if (_pin) {
        _pin(sender);
    }
    
    
}
- (IBAction)drag:(UIPanGestureRecognizer *)sender {
    if (_drag) {
        _drag(sender);
    }
}

- (IBAction)close:(UIButton *)sender {
    if (_close) {
        _close(sender);
    }
    
}
@end
