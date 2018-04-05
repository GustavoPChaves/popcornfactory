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
@property int timer;
@property int type;
@property NSMutableArray<Feedstock *> *recipe;


@end
