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

@synthesize scanDevices, connectDevices;


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
- (IBAction)scanDevices:(id)sender {
}
- (IBAction)connectDevices:(id)sender {
}

NSMutableArray *photos;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed: @"bicycle.png"];
    [vehiclePhoto setImage:image];
    
    //Design Background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.png"] drawInRect:self.view.bounds];
    UIImage *bkgimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:bkgimage];

    
    //Design Labels
    NSArray *labels = [NSArray arrayWithObjects:self.rearPressure, self.frontPressure, self.availableDevices, self.connectionStatus, nil];
    for (UILabel *lbs in labels) {
        lbs.layer.borderColor = [UIColor blueColor].CGColor;
        lbs.layer.borderWidth = 1.0;
        lbs.layer.cornerRadius = 6;
        lbs.backgroundColor = [UIColor whiteColor];
    }
    //Design Buttons
    NSArray *buttons = [NSArray arrayWithObjects:self.scanDevices, self.connectDevices, nil];
    for (UIButton *btn in buttons){
        // Set the button Text Color
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        
        // Set the button Background Color
        [btn setBackgroundColor:[UIColor blueColor]];
        
        CAGradientLayer *btnGradient = [CAGradientLayer layer];
        btnGradient.frame = btn.bounds;
        btnGradient.colors = [NSArray arrayWithObjects:
                              (id)[[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],
                              (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
                              nil];
        [btn.layer insertSublayer:btnGradient atIndex:0];
        // Round button corners
        CALayer *btnLayer = [btn layer];
        [btnLayer setMasksToBounds:YES];
        [btnLayer setCornerRadius:5.0f];
        // Apply a 1 pixel, black border
        [btnLayer setBorderWidth:1.0f];
        [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
