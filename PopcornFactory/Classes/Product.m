//
//  Product.m
//  PopcornFactory
//
//  Created by Ada 2018 on 05/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

#import "Product.h"

@implementation Product

-(id) initWithName:(NSString *) aName andType:(int) aType andTimer:(int) aTimer{
    if(self == [super init]){
        _name = aName;
        _type = aType;
        _timer = aTimer;
        _recipe = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
