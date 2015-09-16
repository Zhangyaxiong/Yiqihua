//
//  PullDownVIew.m
//  ArtExam
//
//  Created by 张亚雄 on 15/9/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "PullDownVIew.h"
#import "AE_draw_info_right.h"
#import "AEArtStudioController.h"
#import "AE_draw_info_right.h"
@interface PullDownVIew ()
@end
@implementation PullDownVIew
@synthesize scrollviewArray;
- (id)initWithFrame:(CGRect)frame :(AEArtStudioController *)studio_control
{
    self = [super initWithFrame:frame];
    if (self)
    {
        m_studio_control = studio_control;
        
        self.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self collectionView_pull];
        
        self.scrollviewArray =[[NSArray alloc]initWithObjects:@"北京市", @"天津市",@"上海市",@"重庆市",@"黑龙江",@"吉林省",@"辽宁省",@"内蒙古",@"河北省",@"山东省",@"江苏省",@"浙江省",@"福建省",@"台湾省",@"广东省",@"江西省",@"湖南省",@"安徽省",@"湖北省",@"河南省",@"山西省",@"宁夏",@"陕西省",@"甘肃省",@"青海省",@"四川省",@"贵州省",@"云南省",@"广西",@"西藏",@"新疆",nil];
        
        NSArray *city_code = [[NSArray alloc]initWithObjects:@"110000", @"120000",@"310000",@"500000",@"230000",@"220000",@"210000",@"150000",@"130000",@"370000",@"320000",@"330000",@"350000",@"710000",@"440000",@"360000",@"110000",@"110000",@"110000",@"430000",@"140000",@"640000",@"610000",@"620000",@"630000",@"510000",@"520000",@"530000",@"450000",@"540000",@"650000", nil];
        //添加字典
        m_dic_province_code = [[NSMutableDictionary alloc]initWithObjects:city_code forKeys: self.scrollviewArray];
        
        
    }
    return self;
}
-(void)collectionView_pull
{
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 330) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor colorWithRed:250.0 green:250.0 blue:250.0 alpha:0.9]];
    
    //注册Cell，必须要有
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self addSubview:self.collectionView];
    }
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (scrollviewArray.count);
    //    return [self.ViewControllerArry count];
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
       
    
    
    UIButton *labelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    按钮位置
    labelBtn.frame = CGRectMake(0, 0, 85, 30);
    //给按钮添加字体
    [labelBtn setTitle:[self.scrollviewArray objectAtIndex:[indexPath row]] forState:UIControlStateNormal];
    
    //    字体位置
    [labelBtn setTitleEdgeInsets:UIEdgeInsetsMake(5, 10, 5, 10)];
    labelBtn.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    [labelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    labelBtn.backgroundColor = [UIColor whiteColor];
    //    设置Button圆角
    [labelBtn.layer setMasksToBounds:YES];
    [labelBtn.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    
    [labelBtn addTarget:self action:@selector(jump_city:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.contentView addSubview:labelBtn];
    return cell;
}
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(73, 30);
    //    上下间距
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 20, 80,30);
    //    上坐下有
}

-(void)jump_city:(id)sender//点击转跳翻页
{
//    设置按钮点击事件
    UIButton *button = (UIButton *)sender;
//   先给参数添加值：字典定义一个属性然后forkey一个值
    NSString *province_code = [m_dic_province_code objectForKey:[button titleForState:UIControlStateNormal]];
//    初始化转跳文件方法+参数
    AE_draw_info_right *infoLeft =[[AE_draw_info_right alloc]init : province_code];
    infoLeft.title =@"画室";
    m_studio_control.hidesBottomBarWhenPushed = YES;
        //把跳转事件和下拉回撤事件放到返回按钮上。
    [m_studio_control tapSelectProvinceView];
    [m_studio_control.navigationController pushViewController:infoLeft animated:true];
    m_studio_control.hidesBottomBarWhenPushed = NO;
}
@end


