//
//  News.h
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import "NewsCategory.h"
#import "NewsImages.h"

@interface News : JSONModel

@property (nonatomic,strong)NSString *Id;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *excerpt;
@property (nonatomic,strong)NSString *alias;
@property (nonatomic,strong)NSURL *webURL;
@property (nonatomic,strong)NSDate *publishingDate;
@property (nonatomic,strong)NSString<Optional>*text;
@property (nonatomic,strong)NewsCategory *category;
@property (nonatomic,strong)NewsImages *images;



@end
