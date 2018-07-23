#
# Be sure to run `pod lib lint MSAL.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MSAL'
  s.version          = '0.2.4'
  s.summary          = 'Microsoft Access Layer POD.'
  s.description      = <<-DESC
    The MSAL library preview for iOS gives your app the ability to begin using the Microsoft Cloud by supporting Microsoft Azure Active Directory and Microsoft Accounts in a converged experience using industry standard OAuth2 and OpenID Connect. The library also supports Microsoft Azure B2C for those using our hosted identity management service.

    The source is branched from MSAL official master 0.1.3 at time of speaking. The pod version is just an internal version.

    Note that for the preview, only iOS is supported with this pod.
                       DESC

  s.homepage         = 'https://github.com/shuurai/msal-for-objc-pod.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shuurai' => 'shane_fan_di@manulife.com' }
  s.source           = { :git => 'https://github.com/shuurai/msal-for-objc-pod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'

  s.prefix_header_file = 'MSAL/AzureSource/MSAL/src/MSAL.pch'
  s.public_header_files = 'MSAL/AzureSource/MSAL/src/public/*.h', 'MSAL/Classes/*.h'
  s.source_files = 'MSAL/AzureSource/MSAL/src/**/*.{h,m}', 'MSAL/Classes/*.{h,m}'

  s.exclude_files = 'MSAL/AzureSource/MSAL/src/**/mac/*', 'MSAL/AzureSource/MSAL/src/cache/mac/*', 'MSAL/AzureSource/MSAL/src/public/mac/*', 'MSAL/AzureSource/MSAL/src/ui/mac/*'

  s.xcconfig     = { 'OTHER_LDFLAGS' => '-ObjC' }

  s.prepare_command = <<-CMD
      git submodule update --init --recursive
  CMD

end
