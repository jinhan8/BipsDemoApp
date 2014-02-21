//
//  ViewController.m
//  BiPS
//
//  Created by Han Jin on 2/17/14.
//  Copyright (c) 2014 RDV Labs LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//photo outlet
@property (weak, nonatomic) IBOutlet UIImageView *vehiclePhoto;
//tire pressure outlets
@property (weak, nonatomic) IBOutlet UILabel *rearPressure;
@property (weak, nonatomic) IBOutlet UILabel *frontPressure;
//bluetooth outlets
@property (weak, nonatomic) IBOutlet UILabel *availableDevices;
@property (weak, nonatomic) IBOutlet UILabel *connectionStatus;


@end

@implementation ViewController

@synthesize vehiclePhoto;




- (IBAction)vehicleSwitch: (id)sender {
    
    UISegmentedControl *segmentControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        UIImage *image = [UIImage imageNamed: @"bicycle.png"];
        [vehiclePhoto setImage:image];
    } else {
        UIImage *image = [UIImage imageNamed: @"motorcycle.png"];
        [vehiclePhoto setImage:image];
    }

}

NSMutableArray *photos;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed: @"bicycle.png"];
    [vehiclePhoto setImage:image];
    //Design Labels
    self.rearPressure.layer.borderColor = [UIColor blueColor].CGColor;
    self.rearPressure.layer.borderWidth = 1.0;
    self.rearPressure.layer.cornerRadius = 8;
    
    self.frontPressure.layer.borderColor = [UIColor blueColor].CGColor;
    self.frontPressure.layer.borderWidth = 1.0;
    self.frontPressure.layer.cornerRadius = 8;
    
    self.availableDevices.layer.borderColor = [UIColor blueColor].CGColor;
    self.availableDevices.layer.borderWidth = 1.0;
    
    self.connectionStatus.layer.borderColor = [UIColor blueColor].CGColor;
    self.connectionStatus.layer.borderWidth = 1.0;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)vehiclePhoto:(UISegmentedControl *)sender {
}
@end
