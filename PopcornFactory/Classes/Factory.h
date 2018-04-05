//
//  Factory.h
//  PopcornFactory
//
//  Created by Ada 2018 on 05/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Factory : NSObject

@property bool working;
@property NSMutableArray<Product *> *slot;
@property NSMutableArray<Product *> *stock;

-(void) manufacture:(Product *) aProduct;
-(void) request:(Product *) aProduct;
-(void) startTimet:(int) aTimer;
-(bool) verifyStock;
@end
