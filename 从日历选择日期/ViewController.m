//
//  ViewController.m
//  从日历选择日期
//
//  Created by lzb on 2016/12/14.
//  Copyright © 2016年 lzb的工程. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "CalendarCollectionViewCell.h"

#define CALENDAR_CELL_ID @"CalendarCollectionViewCell"
#define REUSABLE_VIEW_ID @"REUSABLEVIEW"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation ViewController



#pragma mark UICollectionViewDelegate




#pragma mark UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CALENDAR_CELL_ID forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UIView *superView = self.view;
    CGSize s_superView = superView.frame.size;
    CGFloat w_superView = s_superView.width - 20;
    
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:REUSABLE_VIEW_ID forIndexPath:indexPath];
    reusableView.backgroundColor = [UIColor colorWithRed:232 green:216 blue:196 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, 0, w_superView, 50);
    titleLabel.textColor = [UIColor colorWithRed:151 green:215 blue:97 alpha:1];
    titleLabel.text = @"2017年1月";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [reusableView addSubview:titleLabel];
    
    
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.left.right.top.equalTo(reusableView);
//        make.height.mas_equalTo(reusableView.mas_height).multipliedBy(0.5);
//        
//    }];
    
    
    
    CGFloat w_weekLabel = w_superView/7;
    
    for (NSUInteger i = 0; i < 7; i++) {
        
        UILabel *weekLabel = [UILabel new];
        weekLabel.textAlignment = NSTextAlignmentCenter;
        weekLabel.textColor = [UIColor colorWithRed:151 green:215 blue:97 alpha:1];
        switch (i) {
            case 0:
                weekLabel.text = @"周一";
                break;
            case 1:
                weekLabel.text = @"周二";

                break;
            case 2:
                weekLabel.text = @"周三";

                break;
            case 3:
                weekLabel.text = @"周四";

                break;
            case 4:
                weekLabel.text = @"周五";

                break;
            case 5:
                weekLabel.text = @"周六";

                break;
            case 6:
                weekLabel.text = @"周日";

                break;
                
            default:
                break;
        }
        
        weekLabel.frame = CGRectMake(i*w_weekLabel, 50, w_weekLabel, 50);
        [reusableView addSubview:weekLabel];

        
//        [weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//           
//            make.bottom.equalTo(reusableView);
//            make.top.equalTo(titleLabel);
//            make.width.mas_equalTo(w_weekLabel);
//            make.left.equalTo(reusableView).offset(i*w_weekLabel);
//            
//        }];
        
    }
    
    reusableView.backgroundColor = [UIColor greenColor];
    
    return reusableView;
}

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIView *superView = self.view;
    CGSize s_superView = superView.frame.size;
    CGFloat w_superView = s_superView.width - 20;
    
    CGFloat w_cetCell = w_superView/7;
    
    return CGSizeMake(w_cetCell, 50);
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self setUpCollectionView];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    
   NSDate *myDate = [calendar dateByAddingComponents:((^{
        
        NSDateComponents *dateComponents = [NSDateComponents new];
        dateComponents.month = 1;
        return dateComponents;
        
    })()) toDate:[NSDate date] options:0];
    
    NSLog(@"%@",myDate);
    
    NSDateComponents *dateComponentForDate = [[NSDateComponents alloc] init];
    dateComponentForDate.calendar = calendar;
    dateComponentForDate.year = 2017;
    dateComponentForDate.month = 1;
    
    [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    
//    [calendar enumerateDatesStartingAfterDate:[NSDate date] matchingComponents:dateComponentForDate options:NSCalendarWrapComponents usingBlock:^(NSDate * _Nullable date, BOOL exactMatch, BOOL * _Nonnull stop) {
//        NSLog(@"%@",date);
//    }];
    
}


- (void)setUpCollectionView{
    
    UIView *superView = self.view;
    CGSize s_superView = superView.frame.size;
    CGFloat w_superView = s_superView.width;
    
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.headerReferenceSize = CGSizeMake(w_superView, 100);
    
    
    CGFloat y_collection = 100;
    CGFloat x_collection = 0;
    CGFloat w_collection = s_superView.width - 2*x_collection;
    CGFloat h_collection = s_superView.height - y_collection - 100;
    
    CGRect collectionRect = CGRectMake(x_collection, 100, w_collection, h_collection);
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:collectionRect collectionViewLayout:flowLayout];
//    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"CalendarCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CALENDAR_CELL_ID];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:REUSABLE_VIEW_ID];
    
//    [_collectionView registerClass:[CalendarCollectionViewCell class] forCellWithReuseIdentifier:CALENDAR_CELL_ID];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
