//
//  Bedroom.h
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 11.07.2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, Direction) {
    North = 0,
    South,
    East,
    West
};

@interface Bedroom : NSObject

@property (nonatomic) BOOL hasPrivateBath;

@end

NS_ASSUME_NONNULL_END
