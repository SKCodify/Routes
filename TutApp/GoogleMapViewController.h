//
//  GoogleMapViewController.h
//  TutApp
//
//  Created by Infoedge on 6/1/15.
//  Copyright (c) 2015 Infoedge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>

@interface GoogleMapViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic,retain) CLLocation *destinationLocation;
@property (weak, nonatomic) IBOutlet  GMSMapView *mapView;

@end
