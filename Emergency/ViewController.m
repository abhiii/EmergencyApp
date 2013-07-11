//
//  ViewController.m
//  Emergency
//
//  Created by Hadi Hatunoglu on 10/07/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AreaDataModel.h"
@interface ViewController ()
{
    NSURLConnection *connection;
}
@end

@implementation ViewController
@synthesize latitude,longitude;
- (void)viewDidLoad
{
             
        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=17.4122066497803,78.4370125745364&sensor=true"]];
        NSURLRequest *req=[NSURLRequest requestWithURL:url];
        
        connection=[NSURLConnection connectionWithRequest:req delegate:self];
        
      
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
