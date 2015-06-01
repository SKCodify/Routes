//
//  ViewController.h
//  TutApp
//
//  Created by Infoedge on 5/28/15.
//  Copyright (c) 2015 Infoedge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *latLabel;
@property (weak, nonatomic) IBOutlet UILabel *longLabel;

@end

