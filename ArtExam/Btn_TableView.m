//
//  Btn_TableView.m
//  点击按钮出现下拉列表
//
//  Created by 张亚雄 on 14-3-26.
//  Copyright (c) 2015年.张亚雄 All rights reserved.
//

#import "Btn_TableView.h"


@implementation Btn_TableView

- (id)initWithFrame:(CGRect)frame
{
//    全图结构
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}
//添加视图数据
-(void)addViewData
{
    self.m_bHidden = true;
//    按钮下拉习惯
    self.m_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.m_btn setTitle:self.m_Btn_Name forState:UIControlStateNormal];
//    按钮执行动作
    [self.m_btn addTarget:self action:@selector(expandableButton:) forControlEvents:UIControlEventTouchUpInside];
//    按钮坐标
    self.m_btn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self  addSubview:self.m_btn];
//    初始化调取上述文件的风格
  
     self.m_ViewController.frame = CGRectMake(0, self.m_btn.frame.size.height, self.frame.size.width, 0);
 
//    文件委派
//    self.m_ViewController.delegate_ExpandTableVC = self;
//    文件内容委派
    self.m_ViewController.scrollviewArray  = self.m_TableViewData;
    [self addSubview:self.m_ViewController];

}

-(void)expandableButton:(UIButton*)sender
{
//    下拉效果
    
    [UIView animateWithDuration:0.2f animations:
     ^{
        sender.userInteractionEnabled = false;
        
        if (self.m_bHidden)
        {
            self.m_ViewController.frame = CGRectMake(-2, 35, self.m_btn.frame.size.width, 0);
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.m_btn.frame.size.width, 300);
        }
        else
        {
            [self tableViewHidden];
        }
        
        
        
    } completion:^(BOOL finished) {
        sender.userInteractionEnabled = true;
        self.m_bHidden = !self.m_bHidden;
        
        
    }];
}


-(void)tableViewHidden
{
//    委派数据下拉显示大小
    self.m_ViewController.frame = CGRectMake(0, self.m_btn.frame.size.height, self.m_btn.frame.size.width, 0);
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.m_btn.frame.size.width, self.m_btn.frame.size.height);
    
}
///
////按钮所显示的行数
//    [self expandableButton:self.m_btn];
////    if ([_delegate_Btn_TableView respondsToSelector:@selector(collectionView:didSelectRowAtIndexPath:)])
////    {
////        [_delegate_Btn_TableView collectionView:collectionView cellForItemAtIndexPath:indexPath];
////    }
//   
////    
////    if ([_delegate_Btn_TableView respondsToSelector:@selector(collectionView:didSelectRowAtIndexPath:)]) {
////        
////        }
//    NSLog(@"%d",indexPath.row);
//    
//}

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
     Drawing code
}
*/

@end
