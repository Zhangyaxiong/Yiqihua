//
//  AEColleageList.h
//  ArtExam
//
//  Created by dkllc on 14-9-20.
//  Copyright (c) 2014年 dkllc. All rights reserved.
//
#import "PullDownVIew.h"
#import "DBNDataEntries.h"
#import "AEColleage.h"
@protocol  UICollectionViewDelegateDelegate;
@interface AEColleageList : DBNDataEntries<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray *schoolList;
@property (nonatomic, strong) AEColleage *collegeDetail;
@property (nonatomic, strong) NSString *collegeId;
@property (nonatomic) int locationId;

- (instancetype)initWithAPIName:(NSString *)apiName andDetailId:(NSString *)collegeId;
- (instancetype)initWithAPIName:(NSString *)apiName andUserId:(int)userId;
- (instancetype)initWithAPIName:(NSString *)apiName andLocationId:(int)locationId;
- (id)init :(NSString *)province_code;
- (void)getMostRecentSchools;
- (void)getPrevSchools;

- (void)getSchoolDetail;

- (void)getSearchCollectListsForKey:(NSString *)key;

- (void)getMostRecentMyCollegeList;
- (void)getPrevMyCollegeList;

- (void)getMostCollectCollegeList;
@end
