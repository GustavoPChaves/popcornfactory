//
//  FactoryViewController.h
//  PopcornFactory
//
//  Created by Guilherme Colombini on 05/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface FactoryViewController : UIViewController

@property (weak) NSTimer *timer;
@property NSMutableArray<Product *> *slot;
@property NSMutableArray<Product *> *stock;



- (void) startTimer: (int)product;
- (void) manufactureWithType: (int) type;
- (void) request:(Product *) aProduct;
- (bool) verifyStock;

@end
