//
//  ImageShowTool.h
//  b-link
//
//  Created by 李李江 on 2018/10/12.
//  Copyright © 2018年 Yan Geng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageShowTool : NSObject
+ (void)showImageWithImagePath:(NSString *)ImagePath placeholderImageName:(NSString *)placeholderImageName isWebCache:(BOOL)isWebCache;
+ (void)dismissImageView;
@end
