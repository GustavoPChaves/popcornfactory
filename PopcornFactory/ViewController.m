//
//  ViewController.m
//  PopcornFactory
//
//  Created by Ada 2018 on 05/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
Factory *factory;
    Product *popcorn;
    Product *snack;
    Product *driedTomato;
}
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
    factory = [[Factory alloc] init];
    
    popcorn = [[Product alloc ] initWithName:@"Pipoca" andType:0 andTimer:5];
    snack = [[Product alloc ] initWithName:@"Salgadinho" andType:1 andTimer:10];
    driedTomato = [[Product alloc ] initWithName:@"Tomate Seca" andType:2 andTimer:15];
    
    [[factory slot] addObject:popcorn];
    [[factory slot] addObject:snack];
    [[factory slot] addObject:driedTomato];
    
    [factory manufacture:popcorn withTipe:0];
    
    
}


@end
