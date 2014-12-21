//
//  ViewController.h
//  PulsingHaloDemo
//
//  Created by shuichi on 12/5/13.
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreightOrder.h"


@interface TableSelectedViewController : UIViewController
@property (nonatomic, strong) NSDictionary *dic;
@property (weak, nonatomic) NSString *exchangeString;
@property (weak, nonatomic) FreightOrder *freightOrder;
@end
