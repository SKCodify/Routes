//
//  GoogleMapViewController.m
//  TutApp
//
//  Created by Infoedge on 6/1/15.
//  Copyright (c) 2015 Infoedge. All rights reserved.
//

#import "GoogleMapViewController.h"

@interface GoogleMapViewController ()
{
    CLLocationManager *locationManager;

}

@end

@implementation GoogleMapViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Implement here to check if already KVO is implemented.
//    [self.mapView addObserver:self forKeyPath:@"myLocation" options:NSKeyValueObservingOptionNew context: nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"myLocation"] && [object isKindOfClass:[GMSMapView class]])
    {
        [self.mapView animateToCameraPosition:[GMSCameraPosition cameraWithLatitude:self.mapView.myLocation.coordinate.latitude
                                                                                 longitude:self.mapView.myLocation.coordinate.longitude
                                                                                      zoom:15]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *apd =[UIApplication sharedApplication].delegate;
    
    GMSMutablePath *path = [GMSMutablePath path];
    [path addCoordinate:CLLocationCoordinate2DMake(apd.currentLat,apd.currentLong)];
    [path addCoordinate:CLLocationCoordinate2DMake(IGI_LAT,IGI_LONG)];
    GMSPolyline *rectangle = [GMSPolyline polylineWithPath:path];
    rectangle.strokeWidth = 2.f;
    rectangle.map = self.mapView;
    self.mapView.myLocationEnabled = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
//    CLLocation *currentLocation = newLocation;
    
//    if (currentLocation != nil) {
//        self.longLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
//        self.latLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
//    }
    [locationManager stopUpdatingLocation];
    
}

@end
