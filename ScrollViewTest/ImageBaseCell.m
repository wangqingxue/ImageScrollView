//
//  ImageBaseCell.m
//  ScrollViewTest
//
//  Created by 王庆学 on 2017/12/4.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "ImageBaseCell.h"

@interface ImageBaseCell ()

@property (nonatomic, strong) UIImageView *baseImageView;
@property (nonatomic, strong) UILabel *labelTitle;

@end

@implementation ImageBaseCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        _baseImageView = [[UIImageView alloc]initWithFrame:frame];
        _labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 100, 100)];
        [self addSubview:_baseImageView];
        [self addSubview:_labelTitle];
    }
    return self;
}

- (void)setWithBaseModel:(BaseCellInfo *)baseCellInfo{
    [self.baseImageView setImage:[UIImage imageNamed:baseCellInfo.imageStr]];
    self.labelTitle.text = baseCellInfo.titleStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
