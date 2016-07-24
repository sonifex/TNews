//
//  NewsCategory.h
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface NewsCategory : JSONModel

@property(nonatomic,strong) NSString *Id;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *alias;

@end
