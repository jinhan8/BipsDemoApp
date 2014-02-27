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

UISegmentedControl *segmentControl;

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

- (UIStatusBarStyle)preferredStatusBarStyle{return UIStatusBarStyleLightContent;}

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
    
    //Font for all labels
    [[UILabel appearance] setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0]];
     //Font for all buttons
     [[UILabel appearance] setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:17.0]];
    
    //Design navigation bar
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"aluminum2.png"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
    [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
        shadow, NSShadowAttributeName,
    [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:16.0], NSFontAttributeName, nil]];
    
    //Design tool bar
    [[UIToolbar appearance]setBarTintColor:[UIColor blackColor]];
    // portrait
    [[UIToolbar appearance]setBackgroundImage:[UIImage imageNamed:@"aluminum.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    // landscape
    [[UIToolbar appearance]setBackgroundImage:[UIImage imageNamed:@"YourToolbarBkg-Landscape.png"] forToolbarPosition:UIToolbarPositionAny barMetrics: UIBarMetricsLandscapePhone];
    
    NSShadow *toolShadow = [[NSShadow alloc]init];
    toolShadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    toolShadow.shadowOffset = CGSizeMake(0, 1);
    
    
    //Design Background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.png"] drawInRect:self.view.bounds];
    UIImage *bkgimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:bkgimage];
    //Design Titles
    [[UILabel appearanceWhenContainedIn:[UITableViewCell class], nil]
     setTextColor:[UIColor whiteColor]];
    [[UILabel appearanceWhenContainedIn:[UITableViewCell class], nil]
     setFont: [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:16.0]];
   
    
//    NSArray *titles = [NSArray arrayWithObjects:self.title, self.rearTitle, self.frontTitle, nil];
//    for (UILabel *ttl in titles) {
//        ttl.textColor = [UIColor whiteColor];
//        ttl.font = [UIFont fontWithName:@"Helvetica-Bold" size:8.0];
//    }
    
    //Design Labels
    NSArray *labels1 = [NSArray arrayWithObjects:self.rearPressure, self.frontPressure, self.availableDevices, self.connectionStatus, nil];
    NSArray *labels2 = [NSArray arrayWithObjects:self.availableDevices, self.connectionStatus, nil];
    
    for (UILabel *lbs in labels1) {
        lbs.layer.borderColor = [UIColor whiteColor].CGColor;
        lbs.layer.borderWidth = 1.0;
        lbs.layer.cornerRadius = 5;
        lbs.backgroundColor = [UIColor clearColor];
        lbs.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18];
    }
    for (UILabel *lbs in labels2) {
        lbs.layer.borderColor = [UIColor whiteColor].CGColor;
        lbs.layer.borderWidth = 1.0;
        lbs.layer.cornerRadius = 5;
        lbs.backgroundColor = [UIColor clearColor];
        lbs.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18];
    }
    //Design Buttons
    NSArray *buttons = [NSArray arrayWithObjects:self.connectDevices, nil];
    for (UIButton *btn in buttons){
        // Set the button Text Color
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        
        // Set the button Background Color
        [btn setBackgroundColor:[UIColor whiteColor]];
        
        //Set the button text font and size
        btn.titleLabel.font =
        [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:14.0];
        
//        CAGradientLayer *btnGradient = [CAGradientLayer layer];
//        btnGradient.frame = btn.bounds;
//        btnGradient.colors = [NSArray arrayWithObjects:
//                              (id)[[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],
//                              (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
//                              nil];
//        [btn.layer insertSublayer:btnGradient atIndex:0];
        
        // Round button corners
        CALayer *btnLayer = [btn layer];
        [btnLayer setMasksToBounds:YES];
        [btnLayer setCornerRadius:5.0f];
        // Apply a 1 pixel, black border
        [btnLayer setBorderWidth:1.0f];
        [btnLayer setBorderColor:[[UIColor whiteColor] CGColor]];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
