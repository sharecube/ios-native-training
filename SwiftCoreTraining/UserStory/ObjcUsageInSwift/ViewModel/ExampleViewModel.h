//
//  ExampleViewModel.h
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 2/24/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExampleViewModel : NSObject

@property (nonatomic, readonly) NSMutableArray<UserModel*> *usersList;

- (instancetype)init;

- (void) setUsersList: (NSMutableArray<UserModel*>*) users;

@end

NS_ASSUME_NONNULL_END
