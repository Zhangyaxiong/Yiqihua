//
//  AEArtStudioController.m
//  ArtExam
//
//  Created by chen on 15/8/7.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "AEArtStudioController.h"
#import "AE_draw_info_left.h"
#import "AE_draw_info_right.h"
#import "Btn_TableView.h"




@interface AEArtStudioController ()

@end
@implementation AEArtStudioController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)registerCollectionCellClass
{
    for (int i = 0; i <= m_arrStudioList.count;  i ++)
    {
        if (i == 0)
        {
            [m_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%d",i]];
        }
        else
        {
            [m_collectionView registerClass:[AEStudioCollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%d",i]];
        }
    }
}
- (void)InitCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 10;
    m_collectionView = [[PullCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) collectionViewLayout:layout];
    m_collectionView.delegate = self;
    m_collectionView.dataSource = self;
    m_collectionView.pullCollectionDelegate = self;
    m_collectionView.backgroundColor = [UIColor colorWithRed:250.0 green:250.0 blue:250.0 alpha:0.9];
    [self registerCollectionCellClass];
    m_collectionView.dataSource = self;
    m_collectionView.delegate = self;
    [self.view addSubview:m_collectionView];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
   
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    
    [self initNavItem];
    [self createAdView];
    [self addNavigationRightItemSearch];
    
    UITapGestureRecognizer *tab_ad_recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizerAd:)];
    [m_adView addGestureRecognizer:tab_ad_recognizer];
    UIPanGestureRecognizer *scroll_recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerAd:)];
    [m_picScrollView addGestureRecognizer:scroll_recognizer];
    
    NSDictionary *dic_all_studio_info = [ParseJson parseJsonToDictionary:[NSURL URLWithString:@"http://www.yiqihua.cn/artbox/studio/qlist.do"]];
    m_arrStudioList = [[NSMutableArray alloc]initWithCapacity:0];
    [m_arrStudioList addObjectsFromArray:[[dic_all_studio_info objectForKey:@"data"]objectForKey:@"studiosList"]];
    
    [self InitCollectionView];
    //获取广告列表
    self.adList = [[AEAdList alloc] initWithAPIName:[DBNAPIList getAdListAPI] andFrom:0];
    _adList.delegate = self;
    [_adList getadList];
    [self draw_info_left];
    
    m_pullDownView = [[PullDownVIew alloc]initWithFrame:CGRectMake(0, -330, self.view.frame.size.width, 100) : self];
    [self.view addSubview:m_pullDownView];
  
}
- (void)createAdView
{
    m_adView = [[UIView alloc]initWithFrame:CGRectMake(0, -15, self.view.frame.size.width, 217)];
    m_picScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 145)];
    m_picScrollView.delegate = self;
    [m_adView addSubview:m_picScrollView];
    //广告标题
//    条
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 121, self.view.frame.size.width, 30)];
    [m_adView addSubview:titleView];
//    页码
    m_pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(230, 121, 90, 21)];
    [m_adView addSubview:m_pageControl];
   titleView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
//  字
    m_adTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 121, self.view.frame.size.width-28, 21)];
    [m_adView addSubview:m_adTitleLabel];
   
    
    [self draw_info_left];
    [self draw_info_right];
    
}
-(void)draw_info_left
{
    UIButton *titleViewBtnLt = [[UIButton alloc]initWithFrame:CGRectMake(0, 145, self.view.frame.size.width/2-1, 71)];
    
    titleViewBtnLt.backgroundColor = [UIColor whiteColor];
    
  
    
    [titleViewBtnLt addTarget:self action:@selector(jump_page_left) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *m_UIbutTextLt = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, 150, 75, 40)];
    m_UIbutTextLt.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    m_UIbutTextLt.text = @"画室资讯";
    m_UIbutTextLt.textColor = [UIColor blackColor];
    
    UILabel *m_UIbutTextD = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, 170, 75, 40)];
    m_UIbutTextD.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    m_UIbutTextD.text = @"画室最新动态";
    m_UIbutTextD.textColor = [UIColor grayColor];
    
    //    图片
    UIImageView *imageViewBtn = [[UIImageView alloc] initWithFrame:CGRectMake(15, 152, 55, 55)];
    imageViewBtn.image = [UIImage imageNamed:@"01"];
    [m_adView addSubview:titleViewBtnLt];
    [m_adView addSubview:m_UIbutTextLt];
    [m_adView addSubview:m_UIbutTextD];
    [m_adView addSubview:imageViewBtn];
    
}
-(void)draw_info_right
{
    
    UIButton *titleViewBtnRf = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+1, 145, self.view.frame.size.width/2, 71)];
    titleViewBtnRf.backgroundColor = [UIColor whiteColor];
    
    UILabel *m_UIbutTextRf = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width*3/4, 150, 75, 40)];
    m_UIbutTextRf.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    m_UIbutTextRf.text = @"画室省份";
    m_UIbutTextRf.textColor = [UIColor blackColor];
    
    
    UILabel *m_UIbutTextL = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width*3/4, 170, 75, 40)];
    m_UIbutTextL.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    m_UIbutTextL.text = @"按省份找画室";
    m_UIbutTextL.textColor = [UIColor grayColor];
    
    //    图片
    UIImageView *imageViewBtnLf = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2+5+15, 152, 55, 55)];
    imageViewBtnLf.image = [UIImage imageNamed:@"02"];
    

   [titleViewBtnRf addTarget:self action:@selector(tapSelectProvinceView) forControlEvents:UIControlEventTouchUpInside];

    [m_adView addSubview:titleViewBtnRf];
    [m_adView addSubview: m_UIbutTextRf];
    [m_adView  addSubview:m_UIbutTextL];
    [m_adView addSubview:imageViewBtnLf];

    

}
//转跳页面标题和转跳事件
-(void)jump_page_left
{
    AE_draw_info_left *infoLeft =[[AE_draw_info_left alloc]init];
    infoLeft.title =@"画室资讯";
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:infoLeft animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

//添加搜索按钮
- (void)addNavigationRightItemSearch
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 20, 20);
    [rightBtn addTarget:self action:@selector(onClickSearch:) forControlEvents:UIControlEventTouchUpInside];
    //[rightBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightBtn setImage:[UIImage imageNamed:@"find_search_college.png"] forState:UIControlStateNormal];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = right;
}
- (void)onClickSearch:(id)sender
{
    AESearchViewController *controller = [[AESearchViewController alloc] init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (void)initNavItem
{
    [super initNavItem];
    [self titleView];
}
//标题菜单下拉按钮
- (void)titleView
{
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    titleView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleView;
    
    UIImageView *imageViewtitle = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2+40, 14, 13, 12)];
    
    imageViewtitle.image = [UIImage imageNamed:@"find_pulldown.png"];
    
    UILabel *areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-40, 0, 80, 40)];
    areaLabel.backgroundColor = [UIColor clearColor];
    areaLabel.textColor = [UIColor whiteColor];
    areaLabel.textAlignment = NSTextAlignmentCenter;
    areaLabel.font = [UIFont systemFontOfSize:20.f];
    areaLabel.text = @"画室精选";
    [titleView addSubview:imageViewtitle];
    [titleView addSubview:areaLabel];
    //给label添加一个点击事件手势
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSelectProvinceView)];
    [titleView addGestureRecognizer:tapGes];
    
}
//点击事件
- (void)tapSelectProvinceView
{
    NSLog(@"tapSelectProvinceView");
    [UIView animateWithDuration:0.2 animations:^{
        if(m_pullDownView.frame.origin.y == -330)
        {
            CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            m_pullDownView.frame = frame;
        }
        else if(m_pullDownView.frame.origin.y == 0) {
            CGRect frame = CGRectMake(0, -330, self.view.frame.size.width, 100);
            m_pullDownView.frame = frame;
        }
        
    }];
}
- (void)showAdvertisInfo
{
    m_adTitleLabel.textColor = [DBNUtils getColor:@"33363B"];
    if ([_adList.adAry count] > 0) {
        m_adTitleLabel.text = [[_adList.adAry objectAtIndex:0] descStr];
    }

    m_pageControl.numberOfPages = [self.adList.adAry count];
    
    for (int i = 0; i < [self.adList.adAry count]; i++)
    {
        AEAdvertisement *ad = [self.adList.adAry objectAtIndex:i];
        NSString *url = ad.imgUrl;
        if (url != nil) {
            
            __block DBNImageView *tmpImg = [[DBNImageView alloc]initWithFrame:CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, 181)];
            UIImage *img = [UIImage imageNamed:@"a_home_loading"];
            [tmpImg setImageWithURL:[NSURL URLWithString:url] placeholderImage:img];
            [m_picScrollView addSubview:tmpImg];
        };
    }
    
    m_picScrollView.contentSize = CGSizeMake([self.adList.adAry count] * self.view.frame.size.width, m_picScrollView.frame.size.height);
}

#pragma mark - DBNDataEntriesDelegate
- (void)dataEntriesLoaded:(DBNDataEntries*)dataEntries{
    
    if ([dataEntries isKindOfClass:[AEAdList class]]) {
        
        [self showAdvertisInfo];
    }else{
        
        [m_collectionView reloadData];
    }
    
    [[DBNStatusView sharedDBNStatusView] dismiss];
    
}
- (void)dataEntries:(DBNDataEntries*)dataEntries LoadError:(NSString*)error{
    [[DBNStatusView sharedDBNStatusView] showStatus:error dismissAfter:2];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int num = lroundf(scrollView.contentOffset.x/self.view.frame.size.width);
    m_pageControl.currentPage = num;
    
    AEAdvertisement *ad = [self.adList.adAry objectAtIndex:num];
    m_adTitleLabel.text = ad.descStr;
}
#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (m_arrStudioList.count + 1);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int row = (int)indexPath.row;
    NSString* identifier = [NSString stringWithFormat:@"%d",row];
    
    if (row == 0)
    {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil)
        {
            cell = [[UICollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 190)];
        }
        [cell addSubview:m_adView];
        return cell;
    }
    else
    {
        AEStudioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        if (cell == nil)
        {
            cell = [[AEStudioCollectionViewCell alloc]initWithFrame:CGRectMake(5, 0, self.view.frame.size.width/2-10, 130)];
        }
        cell. backgroundColor = [UIColor whiteColor];
        [cell setCellInfo:[m_arrStudioList objectAtIndex:(indexPath.row - 1)]];
        return cell;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return CGSizeMake(self.view.frame.size.width, 190);
    }else
    {
        return CGSizeMake(self.view.frame.size.width/2 - 10,150);
    }
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
// 定义上下cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// 定义左右cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
//选中collectionviewcell的触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 0) {
        NSDictionary *dic_info = [m_arrStudioList objectAtIndex:indexPath.row-1];
        AEArtStudioDetailEViewController *viewController = [[AEArtStudioDetailEViewController alloc]initWithStudioInfoDictionary:dic_info];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
        self.hidesBottomBarWhenPushed = NO;

    }
    }
#pragma mark - PullCollectionViewDelegate
- (void)pullCollectionViewDidTriggerRefresh:(PullCollectionView*)pullCollectionView
{
    [self performSelector:@selector(refreshCollectionView) withObject:nil afterDelay:0.2f];
}
- (void)pullCollectionViewDidTriggerLoadMore:(PullCollectionView*)pullCollectionView
{
    [self performSelector:@selector(loadMoreDataToCollectionView) withObject:nil afterDelay:0.2f];
}
- (void)refreshCollectionView
{
    m_collectionView.pullTableIsRefreshing = NO;
    NSLog(@"refreshCollectionView");
}
- (void)loadMoreDataToCollectionView
{
    NSString *str_url = [NSString stringWithFormat:@"http://www.yiqihua.cn/artbox/studio/qlist.do?pageNumber=%d",m_arrStudioList.count/10+1];
    NSDictionary *dic_all_studio_info = [ParseJson parseJsonToDictionary:[NSURL URLWithString:str_url]];
    [m_arrStudioList addObjectsFromArray:[[dic_all_studio_info objectForKey:@"data"]objectForKey:@"studiosList"]];
    [self registerCollectionCellClass];
    [m_collectionView reloadData];
    NSLog(@"loadMoreDataToCollectionView");
    m_collectionView.pullTableIsLoadingMore = NO;
}
#pragma mark - 点击广告的事件
- (void)panGestureRecognizerAd:(UIPanGestureRecognizer *)panGestureRecognizer
{
    double speedX = [panGestureRecognizer velocityInView:panGestureRecognizer.view].x;
    double swipe_length = m_picScrollView.contentOffset.x;
    if (speedX>0 && swipe_length > m_picScrollView.frame.size.width/2)
    {
        [UIView animateWithDuration:0.3 animations:^{
            m_picScrollView.contentOffset = CGPointMake(0, 0);
        }];
    }
    if (speedX<0&&swipe_length < m_picScrollView.frame.size.width/2)
    {
        [UIView animateWithDuration:0.3 animations:^{
            m_picScrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
        }];
    }
}
- (void)tapGestureRecognizerAd:(UITapGestureRecognizer *)sender {
    
    AEAdvertisement *ad = [_adList.adAry objectAtIndex:m_pageControl.currentPage];
    
    NSString *tmpUrl = [[ROOTURL stringByAppendingString:@"phone/adwareContent.do?beanid="] stringByAppendingString:ad.tid];
    
    DBNWebViewController *controller = [[DBNWebViewController alloc]initWithWebUrl:tmpUrl];
    
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
    controller.hidesBottomBarWhenPushed = NO;
}
@end
