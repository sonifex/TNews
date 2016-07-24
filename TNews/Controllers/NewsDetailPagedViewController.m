//
//  NewsDetailPagedViewController.m
//  TNews
//
//  Created by Soner Güler on 25/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "NewsDetailPagedViewController.h"

#import "CAPSPageMenu.h"

#import "NewsDetailViewController.h"

@interface NewsDetailPagedViewController ()

@property (nonatomic) CAPSPageMenu *pageMenu;
@property (nonatomic,strong) NSArray *stories;
@property (nonatomic) NSInteger currentIndex;

@end

@implementation NewsDetailPagedViewController

-(instancetype)initWithStories:(NSArray *)stories andCurrentIndex:(NSInteger)currentIndex {
    
    if (self = [super init]) {
        self.stories = stories;
        self.currentIndex = currentIndex;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share)];
    [self.navigationItem setRightBarButtonItem:shareButton];
    
    
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionHideTopMenuBar : @(YES)
                                 };
    
    NSMutableArray *VCs = [NSMutableArray new];
    
    for (News* story in self.stories) {
        [VCs addObject:[[NewsDetailViewController alloc] initWithStory:story]];
    }
    
    self.pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:VCs frame:self.view.frame options:parameters];
    [self.pageMenu moveToPage:self.currentIndex withAnimated:NO];
    
    [self.view addSubview:self.pageMenu.view];
}


#pragma mark - ACTION

- (void)share {
    
    
    News* currentStory = [self.stories objectAtIndex:self.pageMenu.currentPageIndex];
    
    NSArray *items = @[currentStory.title,currentStory.images.page,currentStory.webURL];
    
    UIActivityViewController *activity = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    [self presentViewController:activity animated:YES completion:nil];
}


@end
