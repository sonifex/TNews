//
//  ServiceManager.m
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "ServiceManager.h"

@implementation ServiceManager

+ (ServiceManager*)sharedManager {
    
    static ServiceManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}
- (id)init {
    if (self = [super init]) {
        apiClient = [APIClient sharedClient];
    }
    return self;
}


- (void)getStoriesWithParams:(NSDictionary*)params completition:(APIClientCompletition)completition {
    
    [apiClient GET:@"stories.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BaseResponse *baseResponse = [[BaseResponse alloc] initWithDictionary:responseObject error:nil];
        completition(responseObject,baseResponse.result,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completition(nil,NO,error);
        
    }];
}


- (void)getStoriesWithPage:(NSInteger)page categoryID:(NSString*)categoryID completition:(APIClientCompletition)completition {
    
    NSDictionary *params;
    
    if (categoryID ) {
        params  = @{@"category" : categoryID, @"paging" : @(page)};
    }else {
        params =  @{@"paging" : @(page)};
    }
    
    [self getStoriesWithParams:params completition:^(id response, BOOL success, NSError *error) {
        
        StoriesResponse *storiesResponse = [[StoriesResponse alloc] initWithDictionary:response error:nil];
        completition(storiesResponse,success,error);
        
    }];
    
}


- (void)getCategories_completition:(APIClientCompletition)completition {
    
    [apiClient GET:@"categories.json" parameters:@{@"type": @"story"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        CategoriesResponse *categoriesResponse = [[CategoriesResponse alloc] initWithDictionary:responseObject error:nil];
        completition(categoriesResponse.categories,categoriesResponse.result,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completition(nil,NO,error);
        
    }];
    
}


- (void)getStoryWithID:(NSString*)storyID completition:(APIClientCompletition)completition {
    
    [self getStoriesWithParams:@{@"story": storyID} completition:^(id response, BOOL success, NSError *error) {
        
        News *story = [[News alloc] initWithDictionary:[response objectForKey:@"data"] error:nil];
        completition(story,success,error);
        
    }];
    
}



@end
