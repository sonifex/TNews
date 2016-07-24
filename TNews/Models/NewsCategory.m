//
//  NewsCategory.m
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "NewsCategory.h"

@implementation NewsCategory

+(JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"Id" }];
}

@end
