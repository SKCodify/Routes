//
//  ViewController.m
//  TutApp
//
//  Created by Infoedge on 5/28/15.
//  Copyright (c) 2015 Infoedge. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"


@interface ViewController ()
{
CLLocationManager *locationManager;
}


@end

@implementation ViewController


- (IBAction)showRoute:(id)sender {
    
    AppDelegate* apd = [UIApplication sharedApplication].delegate;
    
    [self showDirection:IGI_LAT
             fromlongitude:IGI_LONG
                toLatitude:apd.currentLat
               tolongitude:apd.currentLong];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationManager requestAlwaysAuthorization];
    }
    
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    [locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.longLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.latLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    AppDelegate *apd =[UIApplication sharedApplication].delegate;
    apd.currentLat=currentLocation.coordinate.latitude ;
    apd.currentLong=currentLocation.coordinate.longitude;
    
    [locationManager stopUpdatingLocation];

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    
//    NSLog(@"Source Controller = %@", [segue sourceViewController]);
//    NSLog(@"Destination Controller = %@", [segue destinationViewController]);
//    NSLog(@"Segue Identifier = %@", [segue identifier]);
    
    if ([[segue identifier]
         isEqualToString:@"showRouteOnMap"]){
        
        MapViewController *mapView = [segue destinationViewController];
        CLLocation *newLocation = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(IGI_LAT, IGI_LONG)
                                                                 altitude:0
                                                       horizontalAccuracy:0
                                                         verticalAccuracy:0
                                                                timestamp:[NSDate date]];
        mapView.destinationLocation=newLocation;
    
}
    else if ([[segue identifier ] isEqualToString:@"googleMapSegue"])
    {
        
    }
}

-(void)showDirection:(float)fromLatitude
        fromlongitude:(float)fromlongitude
           toLatitude:(float)toLatitude
          tolongitude:(float)tolongitude
{
    
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
        NSString* riuteurl = [NSString
                              stringWithFormat:@"comgooglemaps://"
                              @"?saddr=%f,%f&daddr=%f,%f&center=%f,%f&"
                              @"directionsmode=driving&zoom=17&views=traffic",
                              fromLatitude,
                              fromlongitude,
                              toLatitude,
                              tolongitude,
                              fromLatitude,
                              fromlongitude];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:riuteurl]];
        
    } else {
        NSString* riuteurl = [NSString
                              stringWithFormat:@"http://maps.google.com/maps?daddr=%f,%f&saddr=%f,%f",
                              fromLatitude,
                              fromlongitude,
                              toLatitude,
                              tolongitude];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:riuteurl]];
    }
}

@end
