//
//  FactoryViewController.m
//  PopcornFactory
//
//  Created by Guilherme Colombini on 05/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

#import "FactoryViewController.h"

@interface FactoryViewController ()
//MARK: - outlets
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *qtdSlot;

@property (weak, nonatomic) IBOutlet UIButton *stock1Button;
@property (weak, nonatomic) IBOutlet UIButton *stock2Button;
@property (weak, nonatomic) IBOutlet UIButton *stock3Button;
@property (weak, nonatomic) IBOutlet UIButton *stock4Button;

@property BOOL working;
@property int time;
@property NSMutableArray *buttonsStock;
@property NSMutableDictionary *buttons;


@end

@implementation FactoryViewController
//- (IBAction)manufactureAction:(UIButton *)sender {
//	UIButton *button = (UIButton *)sender;
//	NSInteger bTag = button.tag;
//	
//	int type = (int) bTag;
//	[self manufactureWithType: type];
//}
//MARK: - actions
- (IBAction)manufactureActionn:(id)sender {
	UIButton *button = (UIButton *)sender;
	NSInteger bTag = button.tag;
	
	int type = (int) bTag;
	[self manufactureWithType: type];
}

- (IBAction)addRecipeToSlot:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSInteger bTag = button.tag;
    int type = (int) bTag;
    Product *p;
    if([_slot count] < 6){
        switch (type) {
            case 0:
                p = [[Product alloc ] initWithName:@"Pipoca" andType:0 andTimer:5];
                [_slot addObject:p];
                break;
            case 1:
                p = [[Product alloc ] initWithName:@"Salgadinho" andType:1 andTimer:10];
                [_slot addObject:p];
                break;
            case 2:
                p = [[Product alloc ] initWithName:@"Tomate Seco" andType:2 andTimer:15];
                [_slot addObject:p];
                break;
        }
    }
    [_qtdSlot setText:  [NSString stringWithFormat:@"%lu",[_slot count]] ];
        
}
//MARK: - didload
- (void)viewDidLoad {
	[super viewDidLoad];
    
	//starting properties
	_slot = [[NSMutableArray alloc] init];
	_stock = [[NSMutableArray alloc] init];
	_working = NO;
    
    //set stock buttons target
    [_stock1Button addTarget: self action: @selector(removeFromStock:) forControlEvents: UIControlEventTouchUpInside];
    Product *popcorn;
    popcorn = [[Product alloc ] initWithName:@"Pipoca" andType:0 andTimer:5];
    [_slot addObject:popcorn];
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
            [_qtdSlot setText:  [NSString stringWithFormat:@"%lu",[_slot count]] ];
            [self startTimer: product.timer];
            
            [_stock addObject:product];
            
            int qtdStock = (int) [_stock count];
            
            switch (qtdStock) {
                case 1:
                    [_stock1Button setHidden: NO];
        
                    break;
                case 2:
                    [_stock2Button setHidden: NO];
                    break;
                case 3:
                    [_stock3Button setHidden: NO];
                    break;
                case 4:
                    [_stock4Button setHidden: NO];
                    break;
                default:
                    break;
            }
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

- (void) removeFromStock: (UIButton *) sender{
    [sender setHidden: YES];
    Product *p_nil = nil;
    [_stock replaceObjectAtIndex:sender.tag withObject:p_nil];
    //[_stock removeObjectAtIndex: sender.tag];
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
