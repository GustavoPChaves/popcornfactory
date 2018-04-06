//
//  FactoryViewController.m
//  PopcornFactory
//
//  Created by Guilherme Colombini on 05/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

#import "FactoryViewController.h"

@interface FactoryViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property BOOL working;
@property int time;

@end

@implementation FactoryViewController
//- (IBAction)manufactureAction:(UIButton *)sender {
//	UIButton *button = (UIButton *)sender;
//	NSInteger bTag = button.tag;
//	
//	int type = (int) bTag;
//	[self manufactureWithType: type];
//}
- (IBAction)manufactureActionn:(id)sender {
	UIButton *button = (UIButton *)sender;
	NSInteger bTag = button.tag;
	
	int type = (int) bTag;
	[self manufactureWithType: type];
}
- (IBAction)addRecipeToSlot:(id)sender {
}

- (void)viewDidLoad {
	[super viewDidLoad];
    
	//starting properties
	_slot = [[NSMutableArray alloc] init];
	_stock = [[NSMutableArray alloc] init];
	_working = NO;
    
    Product *popcorn;
    popcorn = [[Product alloc ] initWithName:@"Pipoca" andType:0 andTimer:5];
    [_slot addObject:popcorn];
}

- (void) functionName:(UIButton *) sender {
	int var = 0;
}
//MARK: - factory functions
- (void) manufactureWithType: (int) type{
	if(!_working && [_stock count] < 4){
		int index = -1;
		bool found = false;
		
		Product *product;
		
		switch (type) {
			case 0:
				product = [[Product alloc ] initWithName:@"Pipoca" andType:0 andTimer:5];
				break;
			case 1:
				product = [[Product alloc ] initWithName:@"Salgadinho" andType:1 andTimer:10];
				break;
			case 2:
				product = [[Product alloc ] initWithName:@"Tomate Seca" andType:2 andTimer:15];
				break;
			default:
				break;
		}
		
		for (Product *p in _slot) {
			if(p.type == product.type && !found){
                index++;
				found = true;
			}
		}

        if(found){
            _working = YES;
            printf(" found");
            [_slot removeObjectAtIndex:index];
            
            [self startTimer: product.timer];
            
            [_stock addObject:product];
            //printf("%d",[product timer]);
            
            //[self startTimer: product.timer];
            
            //            [NSTimer scheduledTimerWithTimeInterval:[aProduct timer]
            //                                        target:self
            //                                        selector:@selector(addProductToStock:)
            //                                        userInfo:nil repeats:NO];
            //printf("after time");
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

-(bool) verifyStock{
	
	return [_stock count] == 0;
}

//MARK: - timer funcions
- (void) startTimer: (int)product {
	_time = product;
	_timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countingDown) userInfo:nil repeats:YES];
}

- (void) countingDown {
	if (_time == 0){
        
		[_timer invalidate];
		_working = NO;

        
	}
	else{
		//		NSString *text = [NSString stringWithFormat: @"%d", _time];
		//		_label.text = text;
		_time -= 1;
		//
		//		NSLog(@"time producing: %d", _time);
	}
	
	NSString *text = [NSString stringWithFormat: @"%d", _time];
	_timerLabel.text = text;
	
	NSLog(@"time producing: %d", _time);
}

@end
