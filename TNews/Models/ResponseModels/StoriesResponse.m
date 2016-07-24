//
//  StoriesResponse.m
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "StoriesResponse.h"

#import "News.h"

@implementation StoriesResponse

+(JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{ @"data": @"stories" }];
}

@end
