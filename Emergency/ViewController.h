//
//  ViewController.h
//  Emergency
//
//  Created by Hadi Hatunoglu on 10/07/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>
@property(nonatomic,readwrite)double latitude;
@property(nonatomic,readwrite)double longitude;
@end
