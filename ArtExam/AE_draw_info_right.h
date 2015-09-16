//
//  AE_draw_info_right.h
//  ArtExam
//
//  Created by 张亚雄 on 15/9/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullDownVIew.h"
#import "PullTableView.h"
#import "LoadMoreTableFooterView.h"
@protocol  UICollectionViewDelegateDelegate;
@interface AE_draw_info_right : UIViewController<UITableViewDelegate,UITableViewDataSource,PullTableViewDelegate>
{
        NSMutableArray *tabelData;
//   事件一样,参数不一样就行。
    PullTableView *m_tableView;

}
//跨文件传递参数（id）init方法每次都会首先运行的初始化方法
- (id)init :(NSString *)province_code;
@end
