//
//  CalendarCollectionViewCell.m
//  从日历选择日期
//
//  Created by lzb on 2016/12/20.
//  Copyright © 2016年 lzb的工程. All rights reserved.
//

#import "CalendarCollectionViewCell.h"

@interface CalendarCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;


@end


@implementation CalendarCollectionViewCell


- (void)setCalendarDate:(NSDate *)calendarDate{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *component = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:calendarDate];
    
    _dayLabel.text = [NSString stringWithFormat:@"%ld",(long)component.day];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
