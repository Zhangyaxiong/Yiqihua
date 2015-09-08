//
//  PullDownVIew.m
//  ArtExam
//
//  Created by 张亚雄 on 15/9/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "PullDownVIew.h"

@interface PullDownVIew ()
@end
@implementation PullDownVIew

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self collectionView_pull];
        
    
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
    [self.collectionView setBackgroundColor:[UIColor colorWithRed:250.0 green:250.0 blue:250.0 alpha:0.95]];
    
    //注册Cell，必须要有
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self addSubview:self.collectionView];
    self.scrollviewArray = @[@"北京市", @"天津市",@"上海市",@"重庆市",@"黑龙江",@"吉林省",@"辽宁省",@"内蒙古",@"河北省",@"山东省",@"江苏省",@"浙江省",@"福建省",@"台湾省",@"广东省",@"江西省",@"湖南省",@"安徽省",@"湖北省",@"河南省",@"山西省",@"宁夏",@"陕西省",@"甘肃省",@"青海省",@"四川省",@"贵州省",@"云南省",@"广西",@"西藏",@"新疆"];
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (_scrollviewArray.count);
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
    labelBtn.frame = CGRectMake(0, 18, 85, 30);
    
    [labelBtn setTitle:@"" forState:UIControlStateNormal];
    
    //    字体位置
    [labelBtn setTitleEdgeInsets:UIEdgeInsetsMake(5, 10, 5, 10)];
    labelBtn.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    [labelBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    labelBtn.backgroundColor = [UIColor whiteColor];
    //    设置Button圆角
    [labelBtn.layer setMasksToBounds:YES];
    [labelBtn.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    
//    [labelBtn.layer setBorderWidth:1.0]; //边框宽度
//    [labelBtn.layer setBorderColor:[UIColor grayColor].CGColor];//边框颜色
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(17, 2, 110, 30)];
    label.textColor = [UIColor blackColor];

    label.text =[self.scrollviewArray objectAtIndex:[indexPath row]];
    label.backgroundColor =[UIColor colorWithRed:221.0 green:219.0 blue:218.0 alpha:0.7];
    [labelBtn addSubview:label ];
    
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

@end


