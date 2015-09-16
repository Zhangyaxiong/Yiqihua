//
//  PullDownVIew.h
//  ArtExam
//
//  Created by 张亚雄 on 15/9/8.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AEArtStudioController;

@interface PullDownVIew : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    AEArtStudioController *m_studio_control;
    NSDictionary *m_dic_province_code;
}

@property (strong, nonatomic)UICollectionView *collectionView;
@property (nonatomic,strong) NSString *cellString;
@property (nonatomic,strong) NSArray *scrollviewArray;

-(id)initWithFrame:(CGRect)frame :(AEArtStudioController *)studio_control;

@end
