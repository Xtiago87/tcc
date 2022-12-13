#import "ChatModulePlugin.h"
#if __has_include(<chat_module/chat_module-Swift.h>)
#import <chat_module/chat_module-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "chat_module-Swift.h"
#endif

@implementation ChatModulePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftChatModulePlugin registerWithRegistrar:registrar];
}
@end
