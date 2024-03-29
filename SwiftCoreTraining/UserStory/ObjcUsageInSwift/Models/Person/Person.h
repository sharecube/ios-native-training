//
//  Person.h
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 11.07.2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSDate* birthday;

@end

NS_ASSUME_NONNULL_END
