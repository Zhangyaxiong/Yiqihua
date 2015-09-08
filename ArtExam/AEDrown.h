//
//  AEDrown.h
//  ArtExam
//
//  Created by 张亚雄 on 15/9/7.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//




#import <UIKit/UIKit.h>

@interface AEDrown : UIView <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    
}
-(void)collectionView:(UICollectionView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@property (strong, nonatomic)UICollectionView *collectionView;
@property (nonatomic,strong) NSString *cellString;
@property (nonatomic,retain) NSArray *scrollviewArray;
@end



