//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Xiao Lu on 6/14/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItemsUnder50;
@property (nonatomic, readonly) NSArray *allItemsEqualAbove50;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end