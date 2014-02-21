//
//  ViewController.h
//  BiPS
//
//  Created by Han Jin on 2/17/14.
//  Copyright (c) 2014 RDV Labs LLC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "Photo.h"

@interface ViewController : UIViewController


@property (nonatomic)IBOutlet UISegmentedControl *verhiclePhoto;

-(IBAction)vehicleSwitch:(id)sender;

@property (nonatomic) Photo *currentPhoto;
@end
