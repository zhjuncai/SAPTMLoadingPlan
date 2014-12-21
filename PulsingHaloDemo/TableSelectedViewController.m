//
//  ViewController.m
//  PulsingHaloDemo
//
//  Created by shuichi on 12/5/13.
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//

#import "TableSelectedViewController.h"

#import "AMWaveTransition.h"



@implementation TableSelectedViewController

@synthesize exchangeString;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dic=exchangeString;
    NSLog(@"%@",self.dic);

}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


@end
