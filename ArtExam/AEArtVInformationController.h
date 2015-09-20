//
//  AE_draw_info_left.h
//  ArtExam
//
//  Created by 张亚雄 on 15/8/20.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AEArtInformationViewCell.h"
#import "PullTableView.h"
#import "LoadMoreTableFooterView.h"

@interface AEArtVInformationController : UIViewController<UITableViewDelegate,UITableViewDataSource,PullTableViewDelegate>
{
    NSMutableArray *m_arrInfos;
    PullTableView *m_tableView;
}

@end