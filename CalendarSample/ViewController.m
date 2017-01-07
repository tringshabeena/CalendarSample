//
//  ViewController.m
//  CalendarSample
//
//  Created by Shabeena on 1/4/17.
//  Copyright © 2017 tringapps. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *calendarCollectionView;

@end

@implementation ViewController {
    BOOL isAvailabilityInserted;
    NSIndexPath *selectedIndexPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _calendarCollectionView.delegate = self;
    _calendarCollectionView.dataSource = self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(!isAvailabilityInserted){
        return 30;
    }
    else{
        return 31;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if(indexPath.section == 0 && isAvailabilityInserted){
        UICollectionViewCell *AvailabilityCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AvailabilityCellIdentifier" forIndexPath:indexPath];
        cell = AvailabilityCell;
    }
    else{
    static NSString * const reuseIdentifier = @"calendarCellIdentifier";
    UICollectionViewCell *dateCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        cell = dateCell;
   
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section ==0 && !isAvailabilityInserted){
        isAvailabilityInserted = YES;
        if(indexPath.row <6){
        [collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:7 inSection:0]]];
        selectedIndexPath = indexPath;
        [self.calendarCollectionView reloadData];
        }
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
-(CGSize)collectionView: (UICollectionView *) collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    CGSize sizeOfCell;
    sizeOfCell = CGSizeMake(40, 40);
    if(selectedIndexPath == indexPath){
        sizeOfCell.width = CGRectGetWidth(collectionView.frame);
    }
    return sizeOfCell;
   }
//attributes
- (UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes;
    
    return  attributes;
}



@end



