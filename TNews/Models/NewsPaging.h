//
//  NewsPaging.h
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface NewsPaging : JSONModel

@property(assign, nonatomic)int current;
@property(assign, nonatomic)int limit;
@property(assign, nonatomic)int pages;
@property(assign, nonatomic)int items;

@end
