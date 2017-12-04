//
//  ImageBaseView.h
//  ScrollViewTest
//
//  Created by 王庆学 on 2017/12/4.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageCellClickDelegate <NSObject>

- (void)cellClickWithUrl:(NSString *)stringUrl;

@end

@interface ImageBaseView : UIView

@property (nonatomic, assign) id<ImageCellClickDelegate>delegate;
@property (nonatomic, assign) NSInteger widthScale;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) CGSize *pageSize;

- (void)initWithUI;

@end
