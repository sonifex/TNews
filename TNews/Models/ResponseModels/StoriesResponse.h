//
//  StoriesResponse.h
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "BaseResponse.h"

#import "News.h"
#import "NewsPaging.h"

@protocol News
@end

@interface StoriesResponse : BaseResponse

@property (nonatomic,strong) NSArray<News> *stories;
@property (nonatomic,strong) NewsPaging *paging;

@end
