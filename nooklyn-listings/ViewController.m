//
//  ViewController.m
//  nooklyn-listings
//
//  Created by Moiz K. Malik on 12/15/14.
//  Copyright (c) 2014 Moiz. All rights reserved.
//

#import "ViewController.h"
#import "Listings.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *array;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *blogURL = [NSURL URLWithString:@"http://www.nooklyn.com/listings.json" ];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL ];
    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    self.blogPosts = [NSMutableArray array];
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"listings"];
    
    for (NSDictionary *bpDictionary in blogPostsArray) {
        Listings *blogPost = [Listings blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        blogPost.author = [bpDictionary objectForKey:@"author"];
        blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bpDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }
//    array = [[NSMutableArray alloc]init];
//    [array addObject:@"Apple"];
//    [array addObject:@"Juice"];
//    [array addObject:@"Easy"];
//    // Do any additional setup after loading the view, typically from a nib.
    
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
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Listings *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = blogPost.title;
    
    NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
    UIImageView *photo = (UIImageView *)[cell viewWithTag:123];
    photo.image = [UIImage imageWithData:imageData];
    
    
    return cell;
    
}
@end
