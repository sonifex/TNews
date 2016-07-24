//
//  MainViewCotroller.m
//  TNews
//
//  Created by Soner Güler on 23/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "MainViewCotroller.h"

#import "SliderViewController.h"

#import "NewsCell.h"

static  NSString *cellIdentifier =  @"NewsCell";

@interface MainViewCotroller ()

@property (weak, nonatomic) IBOutlet UIView *sliderView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *news;

@property (nonatomic,strong) NewsPaging *paging;

@property (nonatomic,strong) NewsCategory *category;

@property (nonatomic,strong) SliderViewController *sliderVC;

@property (nonatomic) BOOL isBottomReached;

@end




@implementation MainViewCotroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"News";
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadWithCategory:) name:@"reloadNewsWithCategory" object:nil];
    
    [self setupSlider];
    
    self.news = [NSMutableArray new];
    [self getNews];
}



#pragma mark - SETUP

- (void)setupSlider {
    
    self.sliderVC = [[SliderViewController alloc] init];
    [self.sliderVC.view setFrame:CGRectMake(0, 0, CGRectGetWidth(self.sliderView.frame), CGRectGetHeight(self.sliderView.frame))];
    [self.sliderView addSubview:self.sliderVC.view];
    [self addChildViewController:self.sliderVC];
    [self.sliderVC didMoveToParentViewController:self];
}



#pragma mark - SERVICE

- (void)getNews {
    
    //Default starting page number
    NSInteger page = 2;
    
    if (self.paging) {
        page = self.paging.current;
    }
    
    NSString *categoryID;
    if (self.category) {
        categoryID = self.category.Id;
    }
    
    [SVProgressHUD show];
    [[ServiceManager sharedManager] getStoriesWithPage:page categoryID:categoryID  completition:^(StoriesResponse *response, BOOL success, NSError *error) {
        [SVProgressHUD dismiss];
        
        self.isBottomReached = NO;
        
        self.paging = response.paging;
        
        if (self.paging.current == 2) {
            self.news = [NSMutableArray arrayWithArray:response.stories];
        }else {
            [self.news addObjectsFromArray:response.stories];
        }
        
        [self.tableView reloadData];
        
    }];
}

- (void)getNextNews {
    
    NSLog(@"current: %d",self.paging.current);
    
    self.paging.current += 1;
    [self getNews];
}




#pragma mark - ACTION

- (IBAction)refresh{
    [self.tableView setContentOffset:CGPointZero];
    self.paging.current = 2;
    [self getNews];
    [self.sliderVC reloadData];
}

- (void)reloadWithCategory:(NSNotification*)notification {
    
    NewsCategory *selectedCategory = notification.object;
    self.title = selectedCategory.name;
    self.category = selectedCategory;
    
    self.paging.current = 2;
    [self refresh];
    
}


#pragma mark - TableView
#pragma mark DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:self options:nil] objectAtIndex:0];
    }
    
    News *currentNews = [self.news objectAtIndex:indexPath.row];
    [cell setWithNews:currentNews];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.isBottomReached) {
        return;
    }
    if (self.news.count - 1 == indexPath.row) {
        
        self.isBottomReached = YES;
        [self getNextNews];
        
    }
}


@end
