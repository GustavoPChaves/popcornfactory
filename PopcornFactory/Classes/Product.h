//
//  Product.h
//  PopcornFactory
//
//  Created by Ada 2018 on 05/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feedstock.h"

@interface Product : NSObject

@property NSString *name;
@property int type;
@property int timer;
@property NSMutableArray<Feedstock *> *recipe;

-(id) initWithName:(NSString *) aName andType:(int) aType andTimer:(int) aTimer;

@end
