//
//  AppDelegate.m
//  Emergency
//
//  Created by Hadi Hatunoglu on 10/07/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate
@synthesize Lmanager;
@synthesize connection;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    //setting location
    Lmanager=[[CLLocationManager alloc]init];
    Lmanager.delegate=self;
    [Lmanager setDesiredAccuracy:kCLLocationAccuracyBest];
    [Lmanager setDistanceFilter:kCLDistanceFilterNone];
    [Lmanager setActivityType:CLActivityTypeOther];
    [Lmanager startUpdatingLocation];

    return YES;
}


/*
 *  locationManager:didUpdateToLocation:fromLocation:
 *
 *  Discussion:
 *    Invoked when a new location is available. oldLocation may be nil if there is no previous location
 *    available.
 *
 *    This method is deprecated. If locationManager:didUpdateLocations: is
 *    implemented, this method will not be called.
 */
- (void)locationManager:(CLLocationManager *)manager
didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    
    [Lmanager stopUpdatingLocation];
    double lat=newLocation.coordinate.latitude;
    double lon=newLocation.coordinate.longitude;
    //self.viewController.latitude=lat;
    //self.viewController.longitude=lon;
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f&sensor=true",lat,lon]];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    
    connection=[NSURLConnection connectionWithRequest:req delegate:self];
    
    
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"data receiced");
    
    NSDictionary *resultsDic=[[[[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]objectForKey:@"results"]objectAtIndex:0]objectForKey:@"formatted_address"];
    
    ////NSDictionary *dicc=[resultsDic objectForKey:@"formatted_address"];
    
    
    NSLog(@"dicccc is %@",resultsDic);
    
    
    //NSLog(@"formatted dic is %@",dicc);
    
    
    
    
    
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
}


/*
 *  locationManager:didUpdateLocations:
 *
 *  Discussion:
 *    Invoked when new locations are available.  Required for delivery of
 *    deferred locations.  If implemented, updates will
 *    not be delivered to locationManager:didUpdateToLocation:fromLocation:
 *
 *    locations is an array of CLLocation objects in chronological order.
 */
//- (void)locationManager:(CLLocationManager *)manager
//didUpdateLocations:(NSArray *)locations __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);
//
/*
 *  locationManager:didUpdateHeading:
 *
 *  Discussion:
 *    Invoked when a new heading is available.
 */
//- (void)locationManager:(CLLocationManager *)manager
//didUpdateHeading:(CLHeading *)newHeading __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0);
//
//

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
//- (void)locationManager:(CLLocationManager *)manager
//didEnterRegion:(CLRegion *)region __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_0);

/*
 *  locationManager:didExitRegion:
 *
 *  Discussion:
 *    Invoked when the user exits a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
//- (void)locationManager:(CLLocationManager *)manager
//didExitRegion:(CLRegion *)region __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_0);
//
/*
 *  locationManager:didFailWithError:
 *
 *  Discussion:
 *    Invoked when an error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    
    NSLog(@"failed with error %@",[error localizedDescription]);
    
}

/*
 *  locationManager:monitoringDidFailForRegion:withError:
 *
 *  Discussion:
 *    Invoked when a region monitoring error has occurred. Error types are defined in "CLError.h".
 */
//- (void)locationManager:(CLLocationManager *)manager
//monitoringDidFailForRegion:(CLRegion *)region
//withError:(NSError *)error __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_0);

/*
 *  locationManager:didChangeAuthorizationStatus:
 *
 *  Discussion:
 *    Invoked when the authorization status changes for this application.
 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    NSLog(@"authoreization changed");
}

/*
 *  locationManager:didStartMonitoringForRegion:
 *
 *  Discussion:
 *    Invoked when a monitoring for a region started successfully.
 */
//- (void)locationManager:(CLLocationManager *)manager
//didStartMonitoringForRegion:(CLRegion *)region __OSX_AVAILABLE_STARTING(__MAC_TBD,__IPHONE_5_0);
//
///*
// *  Discussion:
// *    Invoked when location updates are automatically paused.
// */
//- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);
//
///*
// *  Discussion:
// *    Invoked when location updates are automatically resumed.
// *
// *    In the event that your application is terminated while suspended, you will
// *	  not receive this notification.
// */
//- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);
//
///*
// *  locationManager:didFinishDeferredUpdatesWithError:
// *
// *  Discussion:
// *    Invoked when deferred updates will no longer be delivered. Stopping
// *    location, disallowing deferred updates, and meeting a specified criterion
// *    are all possible reasons for finishing deferred updates.
// *
// *    An error will be returned if deferred updates end before the specified
// *    criteria are met (see CLError).
// */
//- (void)locationManager:(CLLocationManager *)manager
//didFinishDeferredUpdatesWithError:(NSError *)error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);
//
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
