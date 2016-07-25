//
//  NewsDetailViewController.m
//  TNews
//
//  Created by Soner Güler on 25/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "NewsDetailViewController.h"

#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface NewsDetailViewController ()<UIWebViewDelegate>

@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UIImageView *coverImageView;
@property (strong, nonatomic)  UIWebView *contentWebView;

@property (nonatomic,strong) News* story;
@end

@implementation NewsDetailViewController



- (instancetype)initWithStory:(News*)story {
    if (self = [super init]) {
        
        _story = story;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupViews];
    
    [self getStoryDetail];
    
    [self.titleLabel setText:self.story.title];
    [self.coverImageView setImageWithURL:self.story.images.page usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    
}


#pragma mark - SETUP

- (void)setupViews {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel setFont:[UIFont systemFontOfSize:20]];
    
    self.coverImageView = [[UIImageView alloc] init];
    
    self.contentWebView = [[UIWebView alloc] init];
    self.contentWebView.backgroundColor = [UIColor whiteColor];
    [self.contentWebView sizeToFit];
    self.contentWebView.delegate = self;
    
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.coverImageView];
    [self.view addSubview:self.contentWebView];
    
    
}

#pragma mark - SERVICE

- (void)getStoryDetail {
    
    [[ServiceManager sharedManager] getStoryWithID:self.story.Id completition:^(id response, BOOL success, NSError *error) {
        
        self.story = (News*)response;
        
        [self.contentWebView loadHTMLString:[self changedHtmlString:self.story.text] baseURL:self.story.webURL];
    }];
    
}



- (void)updateViewConstraints {
    
    
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.equalTo(self.view);
        make.height.equalTo(@(250));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImageView.mas_bottom);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.equalTo(@100);
    }];
    
    
    [self.contentWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [super updateViewConstraints];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        return NO;
    }
    return YES;
}


#pragma mark - Helper

- (NSString*)changedHtmlString:(NSString*)html {
    return [NSString stringWithFormat:@"<html> \n"
            "<head> \n"
            "<style type=\"text/css\"> \n"
            "body {font-family: \"%@\"; font-size: %@;} img{max-width: 100%%; }\n"
            "</style> \n"
            "</head> \n"
            "<body>%@</body> \n"
            "</html>", @"Helvetica", @(18), html];
}

@end
