//
//  Book.m
//  SwiftCoreTraining
//
//  Created by Dmytro Geienko on 11.07.2020.
//  Copyright © 2020 chrisik. All rights reserved.
//

#import "Book.h"

@implementation Book

- (instancetype)initWithTitle: (NSString *) title bookAuthor:(Person *)author publication:(NSDate *) date
{
    self = [super init];
    if (self) {
        self.title = title;
        self.author = author;
        self.publicationDate = date;
    }
    return self;
}

@end
