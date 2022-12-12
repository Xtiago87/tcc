#import "NavigationModulePlugin.h"
#if __has_include(<navigation_module/navigation_module-Swift.h>)
#import <navigation_module/navigation_module-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "navigation_module-Swift.h"
#endif

@implementation NavigationModulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNavigationModulePlugin registerWithRegistrar:registrar];
}
@end
