//
//  AE_draw_info_right_cell.m
//  ArtExam
//
//  Created by 张亚雄 on 15/9/15.
//  Copyright (c) 2015年 张亚雄. All rights reserved.
//

#import "AEArtVInformationControllerRightcell.h"

@implementation AEArtVInformationControllerRightcell

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
        
        _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5,self.frame.size.width/3,70)];
        [self addSubview:_ImageView];
        
        _info = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/3+15, 5, self.frame.size.width*2/3-15, self.frame.size.height)];
        _info.lineBreakMode = NSLineBreakByCharWrapping;
        _info.numberOfLines = 2;
        self.info.font = [UIFont boldSystemFontOfSize:15];
        self.info.textColor = [UIColor blackColor];
        self.info.backgroundColor = [UIColor clearColor];
        [self addSubview:_info];
        
        _peoplValue = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3+15, 40, self.frame.size.width/3, self.frame.size.height)];
        self. peoplValue.font = [UIFont boldSystemFontOfSize:12];
        self. peoplValue.textColor = [UIColor grayColor];
        self. peoplValue.backgroundColor = [UIColor clearColor];
        [self addSubview: _peoplValue];
        
        _readnumber = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3+55, 40, self.frame.size.width/3, self.frame.size.height)];
        self.readnumber.font = [UIFont boldSystemFontOfSize:12];
        self.readnumber.textColor = [UIColor grayColor];
        self.readnumber.backgroundColor = [UIColor clearColor];
        [self addSubview:_readnumber];
        
        _draw = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3+15, 25, self.frame.size.width/3, self.frame.size.height)];
        self.draw.font = [UIFont boldSystemFontOfSize:12];
        self.draw.textColor = [UIColor grayColor];
        [self addSubview:_draw];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
