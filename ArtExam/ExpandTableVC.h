//
//  ExpandTableVC.h
//  点击按钮出现下拉列表
//
//  Created by 张亚雄 on 14-3-26.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

@protocol ExpandTableVCDelegate <NSObject>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;



@end

#import <UIKit/UIKit.h>

@interface ExpandTableVC : UITableViewController
@property (strong , nonatomic) NSArray* m_ContentArr;

@property (assign , nonatomic) id<ExpandTableVCDelegate> delegate_ExpandTableVC;
@end
