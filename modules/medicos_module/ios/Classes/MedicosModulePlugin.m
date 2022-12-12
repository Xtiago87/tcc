#import "MedicosModulePlugin.h"
#if __has_include(<medicos_module/medicos_module-Swift.h>)
#import <medicos_module/medicos_module-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "medicos_module-Swift.h"
#endif

@implementation MedicosModulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMedicosModulePlugin registerWithRegistrar:registrar];
}
@end
