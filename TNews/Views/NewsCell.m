//
//  NewsCell.m
//  TNews
//
//  Created by Soner Güler on 24/07/16.
//  Copyright © 2016 Soner Güler. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@interface NewsCell()
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (nonatomic,strong) News *story;

@end

@implementation NewsCell


-(void)setWithNews:(News *)news {
    
    _story = news;
}

- (void)drawRect:(CGRect)rect {
    
    self.titleLabel.text = self.story.title;
    self.categoryLabel.text = self.story.category.name;
    [self.coverImageView setImageWithURL:self.story.images.box usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
