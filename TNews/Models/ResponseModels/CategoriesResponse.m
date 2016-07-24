//
//  CategoriesResponse.m
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "CategoriesResponse.h"

@implementation CategoriesResponse

+(JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{ @"data": @"categories" }];
}

@end
