//
//  AppDelegate.h
//  Emergency
//
//  Created by Hadi Hatunoglu on 10/07/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    UINavigationController *nav;
}

@property(strong,nonatomic)CLLocationManager *Lmanager;
@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)    NSURLConnection *connection;

@property (strong, nonatomic) ViewController *viewController;

@end
