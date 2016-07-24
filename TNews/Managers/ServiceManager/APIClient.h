//
//  APIClient.h
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface APIClient : AFHTTPSessionManager

+ (APIClient*)sharedClient;

@end
