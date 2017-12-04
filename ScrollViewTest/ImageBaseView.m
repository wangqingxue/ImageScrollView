//
//  ImageBaseView.m
//  ScrollViewTest
//
//  Created by 王庆学 on 2017/12/4.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "ImageBaseView.h"
#import "BaseCellInfo.h"
#import "ImageBaseCell.h"

#define vWidth self.bounds.size.width
#define vHeight self.bounds.size.height

@interface ImageBaseView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *baseScrollView;
@property (nonatomic, strong) NSMutableArray *cellArray;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ImageBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.widthScale = 0.2;
    }
    return self;
}

- (void)initWithUI{
    self.baseScrollView.frame = CGRectMake(self.frame.size.width * self.widthScale * 0.5, 0, vWidth * (1 - self.widthScale), self.frame.size.height);
    self.baseScrollView.delegate = self;
    self.baseScrollView.contentSize = CGSizeMake(vWidth * (1 - self.widthScale) * self.dataArray.count, vHeight);
    self.baseScrollView.clipsToBounds = NO;
    self.baseScrollView.pagingEnabled = YES;
    [self addSubview:self.baseScrollView];
    for (NSInteger i = 0; i < self.dataArray.count; i++){
         ImageBaseCell *imageBaseView = [[ImageBaseCell alloc]initWithFrame:CGRectMake(vWidth * (1 - self.widthScale) * i, 0, vWidth * (1 - self.widthScale), vHeight)];
        [self.cellArray addObject:imageBaseView];
        imageBaseView.backgroundColor = [UIColor colorWithRed:arc4random() % 255 /255.0 green:arc4random() % 255 /255.0 blue:arc4random() % 255 /255.0 alpha:1];
        [self.baseScrollView addSubview:imageBaseView];
    }
    self.baseScrollView.contentOffset = CGPointMake(vWidth * (1 - self.widthScale) * 2, 0);
    
//    [self startScroll];
}

- (void)startScroll{
    if (self.timer == nil){
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollNext) userInfo:nil repeats:YES];
    }
}

- (void)scrollNext{
    CGPoint pointContentOffset = self.baseScrollView.contentOffset;
//    [UIView animateWithDuration:0.5 animations:^{
    [self.baseScrollView setContentOffset:CGPointMake(3 * vWidth * (1 - self.widthScale), 0) animated:YES];
//    }];
}

- (void)stopScroll{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self stopScroll];
    if (scrollView.contentOffset.x >= 3 *vWidth * (1 - self.widthScale)){
         ImageBaseCell *imageBaseView = self.cellArray[0];
        [imageBaseView removeFromSuperview];
        [self.cellArray removeObject:imageBaseView];
        for (NSInteger i = 0; i < self.cellArray.count; i++){
            ImageBaseCell *imageBaseView = self.cellArray[i];
            imageBaseView.frame = CGRectMake(i * vWidth * (1 - self.widthScale), 0, vWidth * (1 - self.widthScale), vHeight);
        }
        imageBaseView.frame = CGRectMake(self.cellArray.count * vWidth * (1 - self.widthScale), 0, vWidth * (1 - self.widthScale), vHeight);
        [self.cellArray addObject:imageBaseView];
        [self.baseScrollView addSubview:imageBaseView];
        self.baseScrollView.contentOffset = CGPointMake(vWidth * (1 - self.widthScale) * 2, 0);
    }
    if (scrollView.contentOffset.x <= vWidth * (1 - self.widthScale)) {
        ImageBaseCell *imageBaseView = self.cellArray.lastObject;
        [imageBaseView removeFromSuperview];
        [self.cellArray removeObject:imageBaseView];
        for (NSInteger i = 0; i < self.cellArray.count; i++){
            ImageBaseCell *imageBaseView = self.cellArray[i];
            imageBaseView.frame = CGRectMake((i + 1) * vWidth * (1 - self.widthScale), 0, vWidth * (1 - self.widthScale), vHeight);
        }
        imageBaseView.frame = CGRectMake(0, 0, vWidth * (1 - self.widthScale), vHeight);
        [self.cellArray insertObject:imageBaseView atIndex:0];
        [self.baseScrollView addSubview:imageBaseView];
        self.baseScrollView.contentOffset = CGPointMake(vWidth * (1 - self.widthScale) * 2, 0);
    }
    [self startScroll];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopScroll];
}

- (NSMutableArray *)cellArray{
    if (!_cellArray){
        _cellArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _cellArray;
}

- (UIScrollView *)baseScrollView{
    if (!_baseScrollView){
        _baseScrollView = [[UIScrollView alloc]init];
        _baseScrollView.showsHorizontalScrollIndicator = NO;
        _baseScrollView.bounces = NO;
    }
    return _baseScrollView;
}

- (void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
