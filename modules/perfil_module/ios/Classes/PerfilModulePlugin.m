#import "PerfilModulePlugin.h"
#if __has_include(<perfil_module/perfil_module-Swift.h>)
#import <perfil_module/perfil_module-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "perfil_module-Swift.h"
#endif

@implementation PerfilModulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPerfilModulePlugin registerWithRegistrar:registrar];
}
@end
