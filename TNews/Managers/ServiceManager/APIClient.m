//
//  APIClient.m
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "APIClient.h"

static NSString *const BaseURLString = @"http://t24.com.tr/api/v3/";
static APIClient *_sharedClient = nil;

@implementation APIClient

+ (APIClient *)sharedClient {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:BaseURLString]];
        
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];
        [_sharedClient.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
        
    });
    
    
    
    return _sharedClient;
}

@end
