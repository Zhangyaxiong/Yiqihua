//
//  ExpandCell.h
//  点击按钮出现下拉列表
//
//  Created by 张亚雄 on 14-3-26.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandCell : UITableViewCell
@property (strong , nonatomic) UILabel* m_TileL;
-(void)setCellContentData:(NSString*)name;

@end
