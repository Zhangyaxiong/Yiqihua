//
//  AEColleageViewController.h
//  ArtExam
//
//  Created by dkllc on 14-9-11.
//  Copyright (c) 2014年 dkllc. All rights reserved.
//

#import "DBNViewController.h"
#import "PullTableView.h"
#import "PullDownVIew.h"
@interface AEColleageViewController : DBNViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    PullDownVIew *m_pullDownView;
}

@property (weak, nonatomic) IBOutlet PullTableView *colleageTableView;

- (IBAction)onClickEadress:(id)sender;

- (IBAction)onClickQuestionBank:(id)sender;

- (IBAction)onClickHot:(id)sender;

- (IBAction)onClickSearch:(id)sender;

- (IBAction)onClickChoiceArea:(id)sender;

- (IBAction)onClickExamNews:(id)sender;

@end
