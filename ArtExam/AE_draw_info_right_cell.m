//
//  AE_draw_info_right_cell.m
//  ArtExam
//
//  Created by 张亚雄 on 15/9/15.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "AE_draw_info_right_cell.h"

@implementation AE_draw_info_right_cell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5,self.frame.size.width/3,70)];
        [self addSubview:_ImageView];
        
        _info = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/3+10, 5, self.frame.size.width*2/3-15, self.frame.size.height)];
        _info.lineBreakMode = NSLineBreakByCharWrapping;
        _info.numberOfLines = 2;
        self.info.font = [UIFont boldSystemFontOfSize:15];
        self.info.textColor = [UIColor blackColor];
        self.info.backgroundColor = [UIColor clearColor];
        [self addSubview:_info];
        
        _readnumberprefix = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3+10, 40, self.frame.size.width/3, self.frame.size.height)];
        self.readnumberprefix.font = [UIFont boldSystemFontOfSize:12];
        self.readnumberprefix.textColor = [UIColor grayColor];
        self.readnumberprefix.backgroundColor = [UIColor clearColor];
        [self addSubview:_readnumberprefix];
        
        _readnumber = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3+50, 40, self.frame.size.width/3, self.frame.size.height)];
        self.readnumber.font = [UIFont boldSystemFontOfSize:12];
        self.readnumber.textColor = [UIColor grayColor];
        self.readnumber.backgroundColor = [UIColor clearColor];
        [self addSubview:_readnumber];
        
        _date = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*2/3+20, 40, self.frame.size.width/3, self.frame.size.height)];
        self.date.font = [UIFont boldSystemFontOfSize:12];
        self.date.textColor = [UIColor grayColor];
        [self addSubview:_date];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end