//
//  PullDownVIew.h
//  ArtExam
//
//  Created by 张亚雄 on 15/9/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullDownVIew : UIScrollView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    
}
@property (strong, nonatomic)UICollectionView *collectionView;

@property (nonatomic,strong) NSString *cellString;
@property (nonatomic,retain) NSArray *scrollviewArray;

- (id)initWithFrame:(CGRect)frame;

@end
