//
//  BookTableViewCell.m
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import "BookTableViewCell.h"
#import "BookTableViewCellModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation BookTableViewCell

- (void)configureCellWithModel:(BookTableViewCellModel *)model {
    self.textLabel.text = [model title];
    self.detailTextLabel.text = [model author];
    [self.imageView sd_setImageWithURL:[model imageUrl] placeholderImage:[UIImage imageNamed:@"default"]];
}

@end
