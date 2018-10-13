//
//  ViewController.m
//  pictureShowToolDemo
//
//  Created by 李李江 on 2018/10/12.
//  Copyright © 2018年 李李江. All rights reserved.
//

#import "ViewController.h"
#import "ImageShowTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)onClick:(UIButton *)sender {
    [ImageShowTool showImageWithImagePath:nil placeholderImageName:@"heart" isWebCache:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
