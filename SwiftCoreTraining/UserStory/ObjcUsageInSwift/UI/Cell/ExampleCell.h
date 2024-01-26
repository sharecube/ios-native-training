//
//  ExampleCell.h
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 2/24/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleCell : UITableViewCell

- (void) updateUI:(UserModel*) user;

+ (NSString*) reuseIdentifier;

@property (strong, nonatomic) UIImageView * avatarImage;
@property (strong, nonatomic) UILabel * userNameLabel;

@end

NS_ASSUME_NONNULL_END
