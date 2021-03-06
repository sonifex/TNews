//
//  ServiceManager.h
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APIClient.h"
#import "APIResponseModels.h"

typedef void(^APIClientCompletition)(id response ,BOOL success , NSError* error);

@interface ServiceManager : NSObject{
    
    APIClient *apiClient;
    
}

+ (ServiceManager*) sharedManager;


- (void)getStoriesWithPage:(NSInteger)page categoryID:(NSString*)categoryID completition:(APIClientCompletition)completition;
- (void)getCategories_completition:(APIClientCompletition)completition;
- (void)getStoryWithID:(NSString*)storyID completition:(APIClientCompletition)completition;

@end
