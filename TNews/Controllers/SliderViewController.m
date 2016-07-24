//
//  SliderViewController.m
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "SliderViewController.h"

#import "SliderView.h"

#import "NewsDetailPagedViewController.h"

@interface SliderViewController ()

@property (nonatomic,strong)NSArray *stories;
@property (nonatomic,strong)SwipeView *sliderView;
@property (nonatomic,strong)NewsCategory *category;

@end

@implementation SliderViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadWithCategory:) name:@"reloadNewsWithCategory" object:nil];
    
    self.sliderView = [[SwipeView alloc] initWithFrame:self.view.frame];
    self.sliderView.delegate = self;
    self.sliderView.dataSource = self;
    [self.view addSubview:self.sliderView];
    
    [self getSliderNews];
}

- (void)reloadData {
    [self.sliderView reloadData];
}

- (void)reloadWithCategory:(NSNotification*)notification {
    
    NewsCategory *selectedCategory = notification.object;
    self.category = selectedCategory;
    
    [self getSliderNews];
}


#pragma mark - SERVICE

- (void)getSliderNews {
    
    NSString *categoryID;
    if (self.category) {
        categoryID = self.category.Id;
    }
    
    [[ServiceManager sharedManager] getStoriesWithPage:1 categoryID:categoryID completition:^(StoriesResponse *response, BOOL success, NSError *error) {
        
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
    
    News *currentNews = [self.stories objectAtIndex:index];
    
    SliderView *sliderView = [[SliderView alloc] initWithFrame:view.frame];
    [sliderView setWithStory:currentNews];
    
    return sliderView;
    
}

- (CGSize)swipeViewItemSize:(SwipeView *)swipeView {
    return self.sliderView.frame.size;
}

#pragma mark Delegate

- (void)swipeView:(SwipeView *)swipeView didSelectItemAtIndex:(NSInteger)index {
    
    NewsDetailPagedViewController *pagedDetail = [[NewsDetailPagedViewController alloc] initWithStories:self.stories andCurrentIndex:index];
    [self.navigationController pushViewController:pagedDetail animated:YES];
}



- (void)updateViewConstraints {
    
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [super updateViewConstraints];
}


@end
