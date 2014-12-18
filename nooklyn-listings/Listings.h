//
//  Listing.h
//  nooklyn-listings
//
//  Created by Moiz K. Malik on 12/16/14.
//  Copyright (c) 2014 Moiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Listings : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *beds;
@property (nonatomic, strong) NSString *baths;


// Designated initializer
- (id) initWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *)title;


- (NSURL *) thumbnailURL;
- (NSString *) formattedDate;

@end
