//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Xiao Lu on 6/14/15.
//  Copyright (c) 2015 Xiao Lu. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()

@property (nonatomic) NSMutableArray *privateItemsUnder50;
@property (nonatomic) NSMutableArray *privateItemsEqualAbove50;

@end


@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {

        _privateItemsUnder50 = [[NSMutableArray alloc] init];
        _privateItemsEqualAbove50 = [[NSMutableArray alloc] init];
    }

    return self;
}

- (NSArray *)allItemsUnder50
{
    return self.privateItemsUnder50;
}

- (NSArray *)allItemsEqualAbove50
{
    return self.privateItemsEqualAbove50;
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    if (item.valueInDollars < 50)
        [self.privateItemsUnder50 addObject:item];
    else
        [self.privateItemsEqualAbove50 addObject:item];
    
    
    return item;
}

@end