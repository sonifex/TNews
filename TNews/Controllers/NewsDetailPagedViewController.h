//
//  NewsDetailPagedViewController.h
//  TNews
//
//  Created by Soner Güler on 25/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailPagedViewController : UIViewController

- (instancetype)initWithStories:(NSArray*)stories andCurrentIndex:(NSInteger)currentIndex;

@end
