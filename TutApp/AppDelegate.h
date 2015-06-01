//
//  AppDelegate.h
//  TutApp
//
//  Created by Infoedge on 5/28/15.
//  Copyright (c) 2015 Infoedge. All rights reserved.
//

#import <UIKit/UIKit.h>


#define IGI_LAT 28.556162f
#define IGI_LONG 77.099958f
#define GOOGLE_MAP_API__SERVER_KEY @"AIzaSyAN_64pTpCu1EJ-82XzaYHz37Fv2C2QFMQ"
#define googleMapsApiKey @"AIzaSyAwEtxqhNpkLKn5Fhz_tIVSjoNh9Q1Nf5U"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,assign) double currentLat;
@property(nonatomic,assign) double currentLong;

@end

