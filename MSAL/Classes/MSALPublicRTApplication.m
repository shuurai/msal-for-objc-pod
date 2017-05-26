//
//  MSALPublicRTApplication.m
//  Pods
//
//  This is a wrapper client to expose the refresh token out.
//
//  Created by Shane Fan Di on 26/5/17.
//
//

#import "MSALPublicRTApplication.h"

@implementation MSALPublicRTApplication
{
    
}

- (void)acquireTokenForScopes:(NSArray<NSString *> *)scopes
              completionBlock:(MSALCompletionBlock)completionBlock
{
    [super acquireTokenForScopes:scopes completionBlock:^(MSALResult *result, NSError *error)
     {
         if (error)
         {
             completionBlock(result, error);
             return;
         }
         
         id<MSALTokenCacheAccessor> dataSource = [MSALKeychainTokenCache defaultKeychainCache];
         NSError *nError = nil;
         
         NSArray<MSALRefreshTokenCacheItem *> *allRefreshTokens = [dataSource allRefreshTokens:self.clientId context:nil error:&nError];
         
         if (allRefreshTokens) {
             for (MSALRefreshTokenCacheItem *tokenItem in allRefreshTokens)
             {
                 _refreshToken = [tokenItem refreshToken];
                 // NSLog(@"MSALPublicRTApplication: acquireTokenForScope() found refresh token %@", _refreshToken);
             }
         }
         
         completionBlock(result, error);
     }];
}

- (NSString*)getRefreshToken
{
    return _refreshToken;
}

@end
