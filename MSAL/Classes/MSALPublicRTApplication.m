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

// Acquire tkoen sileng by scopes, user, authority and completion block
- (void)acquireTokenSilentForScopes:(NSArray<NSString *> *)scopes
                               user:(MSALUser *)user
                          authority:(NSString *)authority
                    completionBlock:(MSALCompletionBlock)completionBlock
{
    [super acquireTokenSilentForScopes:scopes user:user authority:authority completionBlock:^(MSALResult *result, NSError *error)
     {
         if (error)
         {
             completionBlock(result, error);
             return;
         }
         
         [self onHandleResult:completionBlock withResult:result];
     }];
}

// Acquire tkoen sileng by scopes, user, authority, forcerefresh, uuid and completion block
- (void)acquireTokenSilentForScopes:(NSArray<NSString *> *)scopes
                               user:(MSALUser *)user
                          authority:(NSString *)authority
                       forceRefresh:(BOOL)forceRefresh
                      correlationId:(NSUUID *)correlationId
                    completionBlock:(MSALCompletionBlock)completionBlock
{
    [super acquireTokenSilentForScopes:scopes user:user authority:authority forceRefresh:forceRefresh correlationId:correlationId completionBlock:^(MSALResult *result, NSError *error)
     {
         if (error)
         {
             completionBlock(result, error);
             return;
         }
         
         [self onHandleResult:completionBlock withResult:result];
     }];
}

// Acquire tkoen sileng by scopes, and completion block
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
         
         [self onHandleResult:completionBlock withResult:result];
     }];
}

// common result handler
- (void)onHandleResult:(MSALCompletionBlock)completionBlock withResult:(MSALResult *)result
{
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
    
    completionBlock(result, nError);
}

- (NSString*)getRefreshToken
{
    return _refreshToken;
}

@end
