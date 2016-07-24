//
//  SliderViewController.m
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "SliderViewController.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface SliderViewController ()

@property (nonatomic,strong)NSArray *stories;
@property (nonatomic,strong)SwipeView *sliderView;

@end

@implementation SliderViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"view size: %@",NSStringFromCGSize(self.view.frame.size));
    
    self.sliderView = [[SwipeView alloc] initWithFrame:self.view.frame];
    self.sliderView.delegate = self;
    self.sliderView.dataSource = self;
    NSLog(@"slider size: %@",NSStringFromCGSize(self.sliderView.frame.size));
    [self.view addSubview:self.sliderView];
    
    [self getSliderNews];
}




#pragma mark - SERVICE

- (void)getSliderNews {
    
    [[ServiceManager sharedManager] getStoriesWithPage:1 completition:^(StoriesResponse *response, BOOL success, NSError *error) {
        
        self.stories = [NSMutableArray arrayWithArray:response.stories];
        [self.sliderView reloadData];
        
    }];
    
}



#pragma mark - Swipe View
#pragma mark Data Source

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView {
    return self.stories.count;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:view.frame];
    
    News *currentNews = [self.stories objectAtIndex:index];
    
    [imageView setImageWithURL:currentNews.images.page usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    return imageView;
    
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView {
    return self.sliderView.frame.size;
}

#pragma mark Delegate

- (void)swipeView:(SwipeView *)swipeView didSelectItemAtIndex:(NSInteger)index {
    
}



- (void)updateViewConstraints {
    
   [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(self.view);
   }];
    
    [super updateViewConstraints];
}


@end
