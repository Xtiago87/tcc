#import "PatientModulePlugin.h"
#if __has_include(<patient_module/patient_module-Swift.h>)
#import <patient_module/patient_module-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "patient_module-Swift.h"
#endif

@implementation PatientModulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPatientModulePlugin registerWithRegistrar:registrar];
}
@end
