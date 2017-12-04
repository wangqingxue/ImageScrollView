//
//  ImageBaseView.m
//  ScrollViewTest
//
//  Created by 王庆学 on 2017/12/4.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "ImageBaseView.h"
#import "BaseCellInfo.h"

#define vWidth self.bounds.size.width
#define vHeight self.bounds.size.height

@interface ImageBaseView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *baseScrollView;

@end

@implementation ImageBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.widthScale = 0.2;
    }
    return self;
}

- (void)initWithUI{
    self.baseScrollView.frame = CGRectMake(self.frame.size.width * self.widthScale * 0.5, 0, self.frame.size.width * (1 - self.widthScale), self.frame.size.height);
    self.baseScrollView.delegate = self;
    self.baseScrollView.contentSize = CGSizeMake(self.widthScale * vWidth * self.dataArray.count, vHeight);
    [self addSubview:self.baseScrollView];
    for (NSInteger i = 0; i < self.dataArray.count; i++){
        ImageBaseView *imageBaseView = [[ImageBaseView alloc]initWithFrame:CGRectMake(vWidth * i, 0, vWidth, vHeight)];
        [self.baseScrollView addSubview:imageBaseView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

- (UIScrollView *)baseScrollView{
    if (!_baseScrollView){
        _baseScrollView = [[UIScrollView alloc]init];
    }
    return _baseScrollView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
