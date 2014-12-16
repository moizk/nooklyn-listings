//
//  ViewController.m
//  nooklyn-listings
//
//  Created by Moiz K. Malik on 12/15/14.
//  Copyright (c) 2014 Moiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *array;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    array = [[NSMutableArray alloc]init];
    [array addObject:@"Apple"];
    [array addObject:@"Juice"];
    [array addObject:@"Easy"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Collection View Methods

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [array count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = [array objectAtIndex:indexPath.row];
    return cell;
}
@end
