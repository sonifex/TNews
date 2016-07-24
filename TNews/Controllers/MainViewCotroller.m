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

@property (nonatomic,strong) SliderViewController *sliderVC;

@end




@implementation MainViewCotroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"News";
    
    self.sliderVC = [[SliderViewController alloc] init];
    [self.sliderVC.view setFrame:CGRectMake(0, 0, CGRectGetWidth(self.sliderView.frame), CGRectGetHeight(self.sliderView.frame))];
    [self.sliderView addSubview:self.sliderVC.view];
    [self addChildViewController:self.sliderVC];
    [self.sliderVC didMoveToParentViewController:self];
    
    self.news = [NSMutableArray new];
    
    [self getNews];
}

#pragma mark - SERVICE

- (void)getNews {
    
    //Default starting page number
    NSInteger page = 2;
    
    if (self.paging) {
        page = self.paging.current+1;
    }
    
    [[ServiceManager sharedManager] getStoriesWithPage:page completition:^(StoriesResponse *response, BOOL success, NSError *error) {
        self.paging = response.paging;
        
        [self.news addObjectsFromArray:response.stories];
        [self.tableView reloadData];
        
    }];
}

- (IBAction)refresh:(UIBarButtonItem *)sender {
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



@end
