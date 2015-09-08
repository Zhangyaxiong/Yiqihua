//
//  Btn_TableView.h
//  点击按钮出现下拉列表
//
//  Created by 张亚雄 on 14-3-26.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//
@protocol Btn_TableViewDelegate <NSObject>

-(void)collectionView:(UICollectionView *)collectionView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end


#import <UIKit/UIKit.h>
#import "AEDrown.h"


@interface Btn_TableView : UIView
//下拉按钮
@property (strong , nonatomic) UIButton* m_btn;
//下拉内容
@property (strong , nonatomic) AEDrown* m_ViewController;
//是否弹出下拉列表
@property (assign , nonatomic) BOOL m_bHidden;
//下拉按钮名称
@property (strong , nonatomic) NSString* m_Btn_Name;
//委派内容
@property (strong , nonatomic) NSArray* m_TableViewData;

@property (assign , nonatomic) id<Btn_TableViewDelegate> delegate_Btn_TableView;



-(void)addViewData;



@end












