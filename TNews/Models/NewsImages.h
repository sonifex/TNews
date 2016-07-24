//
//  NewsImages.h
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface NewsImages : JSONModel

@property (nonatomic,strong)NSURL *list;
@property (nonatomic,strong)NSURL *box;
@property (nonatomic,strong)NSURL *page;
@property (nonatomic,strong)NSURL *grid;

@end
