//
//  News.m
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "News.h"

#import "JSONValueTransformer+URLTransformer.h"

@implementation News

+(JSONKeyMapper*)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"Id",
                                                       @"urls.web": @"webURL"
                                                       }];
}


@end
