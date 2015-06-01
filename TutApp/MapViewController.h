//
//  MapViewController.h
//  TutApp
//
//  Created by Infoedge on 5/31/15.
//  Copyright (c) 2015 Infoedge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>
@property (nonatomic,retain) CLLocation *destinationLocation;
@property (weak, nonatomic) IBOutlet MKMapView *routeView;

@end
