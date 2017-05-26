//
//  MSALPublicRTApplication.h
//  Pods
//
//  Created by Shane Fan Di on 26/5/17.
//
//

#import <Foundation/Foundation.h>
#import <MSAL/MSAL.h>

@interface MSALPublicRTApplication : MSALPublicClientApplication

@property NSString *refreshToken;

/**
 * Gives back the refresh token
 */
- (NSString*)getRefreshToken;

@end
