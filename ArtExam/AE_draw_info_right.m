//
//  AE_draw_info_right.m
//  ArtExam
//
//  Created by 张亚雄 on 15/9/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

//#import "AEArtInformationViewCell.h"
#import "AEStudioCollectionViewCell.h"
#import "ParseJson.h"
#import "AE_draw_info_right_cell.h"
#import "DBNWebViewController.h"
#import "LoadMoreTableFooterView.h"
#import "AE_draw_info_right.h"

@interface AE_draw_info_right ()

@end

@implementation AE_draw_info_right
- (id)init :(NSString *)province_code
{
    self = [super init];
    if (self) {
        NSString *str_url = [NSString stringWithFormat:@"http://www.yiqihua.cn/artbox/studio/qlist.do?locationId=%@",province_code];
        tabelData = [[NSMutableArray alloc]initWithCapacity:0];
        NSDictionary *dic_all_info = [ParseJson parseJsonToDictionary:[NSURL URLWithString:str_url]];
        [tabelData addObjectsFromArray:[[dic_all_info objectForKey:@"data"]objectForKey:@"studiosList"]];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //下拉刷新的
    m_tableView =[[PullTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 70)];
    m_tableView.dataSource = self;
    m_tableView.delegate = self;
    m_tableView.pullDelegate = self;
    [self.view addSubview:m_tableView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return tabelData.count ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - PullCTableViewDelegate
- (void)pullTableViewDidTriggerRefresh:(PullTableView*)pullTableView
{
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:0.2f];
}

- (void)pullTableViewDidTriggerLoadMore:(PullTableView*)pullTableView
{
    
    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:0.2f];
}
- (void)refreshTable
{
    m_tableView.pullTableIsRefreshing = YES;
    NSLog(@"refreshTableView");
}
- (void)loadMoreDataToTable
{
    //    下拉内容
    NSString *str_url = [NSString stringWithFormat:@"http://www.yiqihua.cn/artbox/studio/qlist.do?locationId=%d",tabelData.count/10+1];
    NSDictionary *dic_all_info = [ParseJson parseJsonToDictionary:[NSURL URLWithString:str_url]];
    [tabelData addObjectsFromArray:[dic_all_info objectForKey:@"rows"]];
    [m_tableView reloadData];
    NSLog(@"loadMoreDataToTableView");
    m_tableView.pullTableIsLoadingMore = NO;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    AE_draw_info_right_cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[AE_draw_info_right_cell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dic_info = [tabelData objectAtIndex:indexPath.row];
   NSString *str_img_url = [NSString stringWithFormat:@"http://www.yiqihua.cn/artbox/phone/idownload.do?fileid=%@",[dic_info objectForKey:@"cover"]];
    NSURL *imgUrl = [NSURL URLWithString:str_img_url];
    [cell.ImageView setImageWithURL:imgUrl placeholderImage:nil];
    cell.info.text = [dic_info objectForKey:@"name"];
    cell.peoplValue.text = @"人气值:";
    cell.readnumber.text = [[dic_info objectForKey:@"views"] stringValue];
    cell.draw.text = [dic_info objectForKey:@"type"];
    
    return cell;
}
//跳转下一级
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        NSDictionary *dic_info_tab = [tabelData objectAtIndex:indexPath.row];
        AEArtStudioDetailEViewController *tableViewcell = [[AEArtStudioDetailEViewController alloc]initWithStudioInfoDictionary:dic_info_tab];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:tableViewcell animated:YES];
        self.hidesBottomBarWhenPushed = NO;
}

@end






