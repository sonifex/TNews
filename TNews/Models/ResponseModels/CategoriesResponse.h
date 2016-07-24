//
//  CategoriesResponse.h
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "BaseResponse.h"

#import "NewsCategory.h"

@protocol NewsCategory
@end

@interface CategoriesResponse : BaseResponse

@property (nonatomic,strong)NSArray<NewsCategory>*categories;

@end
