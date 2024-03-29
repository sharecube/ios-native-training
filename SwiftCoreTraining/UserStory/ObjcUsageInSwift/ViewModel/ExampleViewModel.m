//
//  ExampleViewModel.m
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 2/24/19.
//  Copyright © 2019 chrisik. All rights reserved.
//

#import "ExampleViewModel.h"

@interface ExampleViewModel ()

// Private Access
@property (nonatomic, strong, readwrite) NSMutableArray<UserModel*>* usersList;

@end

@implementation ExampleViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.usersList = [NSMutableArray<UserModel*> array];
    }
    return  self;
}

+ (void) setCarsList: (NSMutableArray<UserModel*>*) users {
    self.carsList = users;
}

@end
