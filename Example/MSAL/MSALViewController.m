//
//  MSALViewController.m
//  MSAL
//
//  Created by acct<blob>=0x50617373776F726473C2A06E6F74C2A07361766564  Passwords0240not0240saved on 05/24/2017.
//  Copyright (c) 2017 acct<blob>=0x50617373776F726473C2A06E6F74C2A07361766564  Passwords0240not0240saved. All rights reserved.
//


#import <MSAL/MSAL.h>
#import "MSALViewController.h"
#define CLIENT_ID @"11744750-bfe5-4818-a1c0-655455f68fa7"

@interface MSALViewController ()

@end

@implementation MSALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSError *error = nil;
    
    MSALPublicClientApplication *client = [[MSALPublicClientApplication alloc] initWithClientId:CLIENT_ID error:&error];
    
    if(error != nil) {
        NSLog(@"checking for error %@", error.description);
    }
    
    [client acquireTokenForScopes:@[@"User.Read", @"Calendars.Read"]
                       completionBlock:^(MSALResult *result, NSError *error)
     {
         if (error)
         {
             
             NSLog(@"failed %@", error.description);
             return;
         }
         
         // In the initial acquire token call we'll want to look at the user object
         // that comes back in the result.
         MSALUser *user = result.user;
         
         NSLog(@"user infor %@", user.name);
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
