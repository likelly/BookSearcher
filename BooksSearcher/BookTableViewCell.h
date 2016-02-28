//
//  BookTableViewCell.h
//  BooksSearcher
//
//  Created by Heng Zeng on 2/28/16.
//  Copyright © 2016 verazeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BookTableViewCellModel;

@interface BookTableViewCell : UITableViewCell

- (void)configureCellWithModel:(BookTableViewCellModel *)model;

@end
