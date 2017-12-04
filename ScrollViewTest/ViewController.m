//
//  ViewController.m
//  ScrollViewTest
//
//  Created by 王庆学 on 2017/12/4.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "ViewController.h"
#import "ImageBaseView.h"

@interface ViewController ()

@property (nonatomic, strong) ImageBaseView *imageBaseView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageBaseView = [[ImageBaseView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:_imageBaseView];
    _imageBaseView.dataArray = @[@"1",@"2",@"3",@"4",@"5"];
    [_imageBaseView initWithUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
