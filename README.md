# MSAL

[![CI Status](http://img.shields.io/travis/shuurai/MSAL.svg?style=flat)](https://travis-ci.org/shuurai/MSAL)
[![Version](https://img.shields.io/cocoapods/v/MSAL.svg?style=flat)](http://cocoapods.org/pods/MSAL)
[![License](https://img.shields.io/cocoapods/l/MSAL.svg?style=flat)](http://cocoapods.org/pods/MSAL)
[![Platform](https://img.shields.io/cocoapods/p/MSAL.svg?style=flat)](http://cocoapods.org/pods/MSAL)


## Current Pod Trunked Version

0.2.2


## Example

To run/configure the wrapper project, clone the repo, and run `pod install` from the Example directory first. Branch it, sugar it and make it better.


## Usage

In order to get refresh token out, please use:

```objective-c
#import <MSALPublicRTApplication.h> 

MSALPublicRTApplication *client = [[MSALPublicRTApplication alloc] initWithClientId:CLIENT_ID error:&error];

... do the supported authorization ...

NSLog([client getRefreshToken])


```

Only the following methods are supported with an refresh token

1. acquireTokenForScopes(scope, completionBlock) 
2. acquireTokenSilentForScopes(scope, user, authority, completionBlock)
3. acquireTokenSilentForScopes(scope, user, authority, forceRefresh, correlationId, completionBlock)


## Requirements

Note: This is configured to pull automatically from the official MSAL repo (at the time of speaking 0.1.1). Tests are not implemented in this pod as the original source code is expected to be thoroughly tested by the MS team. This pod uses spec.prepare_command to automatically parse the git submodule from official MSAL repo for the latest code.

**However**, any code relates to 'mac' is currently ignored by this configuration.


## Important

The official MSAL is still at its preview phase, subject to change anytime. It is important to check against any version change after 0.1.1, to see if there are any major changes to the file structure which will affect the install/build of the pod into a client project. Development usage should very much follow how it is used on the official MSAL repo/documentation.


## Client Project Installation

MSAL is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MSAL"
```

Alternatively, modify the Podfile or using command line to add MSAL pod using directly the git repo url.



## Pod Update

When podspec, wrapper logic, or the source MSAL files have been changed, it is important to pod check the pod, tag it and push to the pod trunk.

  - after modification, commit
  - modify the podspec, with the new spec number, e.g. 0.2.3, make sure it is newer than the current one on "http://cocoapods.org/pods/MSAL"
  - 'git tag 0.2.3 && git push origin --tags'
  - 'pod spec lint'
  - 'pod trunk push' <-- this requires the repo url to be accessible in public to allow cocoapods to pull the pod from



## Author

shuurai, hyperfan@hotmail.com

## License

MSAL is available under the MIT license. See the LICENSE file for more info.
