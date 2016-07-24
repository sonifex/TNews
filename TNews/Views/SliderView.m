//
//  SliderView.m
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "SliderView.h"

#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface SliderView ()

@property (nonatomic,strong) UIImageView *coverImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) News *story;

@end

@implementation SliderView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.coverImageView = [[UIImageView alloc] init];
        
        self.titleLabel = [[UILabel alloc] init];
        [self.titleLabel setNumberOfLines:0];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.titleLabel setFont:[UIFont systemFontOfSize:22 weight:UIFontWeightRegular]];
        [self.titleLabel setBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.500]];
        [self.coverImageView addSubview:self.titleLabel];
        [self addSubview:self.coverImageView];
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    [self.titleLabel setText:self.story.title];
    [self.coverImageView setImageWithURL:self.story.images.box usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
}


- (void)setWithStory:(News*)story {
    
    _story = story;
    
}


- (void)updateConstraints {
    
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.lessThanOrEqualTo(self);
    }];
    
    [super updateConstraints];
}




@end
