//
//  House.h
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 06.07.2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bedroom.h"

NS_ASSUME_NONNULL_BEGIN

@interface House : NSObject

@property (nonatomic, copy) NSString * address;
@property (nonatomic) NSInteger * numberOfBedrooms;
@property (nonatomic) BOOL hasHotTub;

@property (nonatomic) Bedroom * frontBedroom;
@property (nonatomic) Bedroom * backBedroom;

@end

NS_ASSUME_NONNULL_END
