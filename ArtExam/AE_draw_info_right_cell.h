//
//  AE_draw_info_right_cell.h
//  ArtExam
//
//  Created by 张亚雄 on 15/9/15.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//
#import "PullDownVIew.h"
#import <UIKit/UIKit.h>
@class PullDownVIewUIView;
@interface AE_draw_info_right_cell : UITableViewCell
@property (nonatomic, retain) UIImageView *ImageView;
@property (nonatomic, retain) UILabel *info;
@property (nonatomic, retain) UILabel *readnumberprefix;
@property (nonatomic, retain) UILabel *readnumber;
@property (nonatomic, retain) UILabel *date;
@end