//
//  ExampleViewController.h
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 2/21/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExampleView.h"
#import "ExampleViewModel.h"
#import "ExampleCell.h"
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property ExampleView *contentView;
@property ExampleViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
