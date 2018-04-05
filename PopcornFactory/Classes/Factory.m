//
//  Factory.m
//  PopcornFactory
//
//  Created by Ada 2018 on 05/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

#import "Factory.h"

@implementation Factory

-(id) init{
    if(self = [super init]){
        _slot = [[NSMutableArray alloc] init];
        _stock = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) manufacture:(Product *) aProduct withTipe:(int) aType{
    if(!_working){
        
        int index = 0;
        bool found = false;
        
        for (Product *p in _slot) {
            if([p type] == [aProduct type] && !found){
                found = true;
            }
        }
        if(found){
             printf("entrou found");
            [_slot removeObjectAtIndex:index];
            
            printf("%d",[aProduct timer]);
            
            [NSTimer scheduledTimerWithTimeInterval:[aProduct timer] target:self selector:@selector(addProductToStock:) userInfo:aProduct repeats:NO];
            
//            [NSTimer scheduledTimerWithTimeInterval:[aProduct timer]
//                                        target:self
//                                        selector:@selector(addProductToStock:)
//                                        userInfo:nil repeats:NO];
            printf("after time");
            //[self startTimer:[aProduct timer]];
            
            //[_stock addObject:aProduct];
            
        }else{
            //not found
        }

        
        
    }
}
-(void) request:(Product *) aProduct{
    if([_slot count] < 6){
        [_slot addObject:aProduct];
    }else{
        //slot cheio
    }
}
-(void) startTimer:(int) aTimer{

//    [NSTimer scheduledTimerWithTimeInterval:aTimer target:self selector:@selector(addProductToStock:) userInfo:nil repeats:NO];

}

-(void) addProductToStock:(id ) sender{
    
    printf("entrou");
    NSLog(@"%@",[sender userInfo] );
    [_stock addObject:[sender userInfo]];
}

-(void) timerTick:(id) sender{
    _timeProducing ++;
}
-(bool) verifyStock{
    
    return [_stock count] == 0;
}

@end
