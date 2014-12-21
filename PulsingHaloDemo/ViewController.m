//
//  ViewController.m
//  PulsingHaloDemo
//
//  Created by shuichi on 12/5/13.
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//

#import "ViewController.h"
#import "PulsingHaloLayer.h"
#import "AMWaveTransition.h"
#import "BeaconClient.h"

#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import <CFNetwork/CFNetwork.h>
#import "TableViewController.h"

#define kMaxRadius 160


@interface ViewController () <UINavigationControllerDelegate, SKPSMTPMessageDelegate>

@property (nonatomic,strong)BeaconClient *beaconClient;
@property (nonatomic, strong) PulsingHaloLayer *halo;

@property (weak, nonatomic) IBOutlet UIImageView *beaconView;

@property (nonatomic, weak) UISlider *radiusSlider;
@property (nonatomic, weak) UISlider *rSlider;
@property (nonatomic, weak) UISlider *gSlider;
@property (nonatomic, weak) UISlider *bSlider;


//tableview
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *footView;

@end


@implementation ViewController
NSArray *detailLabels;
NSArray *detailValues;

NSArray *itemLabels;
NSArray *itemValues;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Freight Order Details";
//    UIImage *bgImage=[UIImage imageNamed:@"DarkBlueStainlesssteel.jpg"];
    
    
//    UIImage *bgImage=[UIImage imageNamed:@"orderviewbackground.png"];
//    self.tableView.backgroundColor=[UIColor colorWithPatternImage:bgImage];
//    [self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orderviewbackground.png"]]];
//    [self.footView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"leatherbg.png"]]];
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]]];
//    self.viewbg.backgroundColor=[UIColor colorWithPatternImage:bgImage];
    
    self.halo = [PulsingHaloLayer layer];

    CGPoint point=self.beaconView.center;
    
    point.y=self.beaconView.superview.superview.frame.size.height-self.beaconView.superview.frame.size.height-10;
    point.x=self.beaconView.superview.superview.frame.size.width/2;
    self.halo.position = point;
    
    [self.view.layer insertSublayer:self.halo below:self.beaconView.layer];
    [self setupInitialValues];
    
    
    
    FreightOrder *order = self.freightOrder;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    
    detailLabels = @[@"Freight Order ID", @"Shipper", @"Consignee", @"Driver", @"Pickup Date", @"Delivery Date", @"Delivery Address"];
    detailValues = @[order.freightOrderID, order.shipper, order.consignee, order.driver,
                     [dateFormatter stringFromDate:order.pickupDatetime],
                     [dateFormatter stringFromDate:order.deliveryDatetime], order.deliveryAddress];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
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

-(void) start:(id)sender{
    if (!_beaconClient) {
        _beaconClient = [[BeaconClient alloc] init];
    }
    _beaconClient.freightOrder=self.freightOrder;
    [_beaconClient openClient];
//    TableViewController *ibeacontablew = [self.storyboard instantiateViewControllerWithIdentifier:@"ibeacontableview"];
//    
//    [self.navigationController pushViewController:ibeacontablew animated:YES];
}

// =============================================================================
#pragma mark - Private

- (void)setupInitialValues {

    self.radiusSlider.value = 0.5;    
    self.rSlider.value = 0;
    self.gSlider.value = 0.487;
    self.bSlider.value = 1.0;

}

#pragma mark - SKPSMTPMessageDelegate

- (void)messageSent:(SKPSMTPMessage *)message
{
    
    NSLog(@"Yay! Message was sent!");
    //NSLog(@"delegate - message sent");
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    
//    NSLog(@"Darn! Error!\n%i: %@\n%@", [error code], [error localizedDescription], [error localizedRecoverySuggestion]);
    
    
    //NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
}

// =============================================================================
#pragma mark - IBAction


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.f;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return  @"Order Details Info";
    }else{
        return  @"Items";
    }
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40.f)];
////    headerView.backgroundColor  = [UIColor groupTableViewBackgroundColor];
//    
//    [headerView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"orderheader.png"]]];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 320, 40.f)];
//    label.textColor = [UIColor grayColor];
//    
//    if (section == 0) {
//        label.text = @"Order Details Info";
//    }else{
//        label.text = @"Items";
//    }
//    
//    [headerView addSubview:label];
//    return headerView;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return [detailLabels count];
    }else{
        return [self.freightOrder.foItems count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = @"OrderDetailCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    UIImage *image = [UIImage imageNamed:@"orderitembg.png"];
//    [cell setBackgroundColor:[UIColor colorWithPatternImage:image]];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = detailLabels[indexPath.row];
        cell.detailTextLabel.text = detailValues[indexPath.row];
    }else{
        OrderItem *orderItem = self.freightOrder.foItems[indexPath.row];
        cell.textLabel.text = orderItem.itemName;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", orderItem.quantity, orderItem.unitOfMeasure];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"segueDetectDistance"]){
        UINavigationController *beaconNavController = segue.destinationViewController;
        TableViewController *beaconVC = [beaconNavController.viewControllers firstObject];
        beaconVC.freightOrder=self.freightOrder;
        beaconVC.beaconClient=_beaconClient;
    }
}

//禁止屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
}

@end
