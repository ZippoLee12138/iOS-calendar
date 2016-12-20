//
//  ViewController.m
//  从日历选择日期
//
//  Created by lzb on 2016/12/14.
//  Copyright © 2016年 lzb的工程. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    
    [calendar dateByAddingComponents:<#(nonnull NSDateComponents *)#> toDate:<#(nonnull NSDate *)#> options:<#(NSCalendarOptions)#>];
    
    
    NSDateComponents *dateComponentForDate = [[NSDateComponents alloc] init];
    dateComponentForDate.calendar = calendar;
    dateComponentForDate.year = 2017;
    dateComponentForDate.month = 1;
    
    [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    
//    [calendar enumerateDatesStartingAfterDate:[NSDate date] matchingComponents:dateComponentForDate options:NSCalendarWrapComponents usingBlock:^(NSDate * _Nullable date, BOOL exactMatch, BOOL * _Nonnull stop) {
//        NSLog(@"%@",date);
//    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
