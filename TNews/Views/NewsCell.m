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

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;

@end

@implementation NewsCell


-(void)setWithNews:(News *)news {
    
    self.titleLabel.text = news.title;
    [self.coverImageView setImageWithURL:news.images.box usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
