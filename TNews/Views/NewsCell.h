//
//  NewsCell.h
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsCell : UITableViewCell

- (void)setWithNews:(News*)news;

@end
