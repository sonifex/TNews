//
//  SliderViewController.h
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeView.h"

@interface SliderViewController : UIViewController<SwipeViewDataSource,SwipeViewDelegate>

- (void)reloadData;


@end
