#import "MecabForFlutterPlugin.h"
#if __has_include(<mecab_for_flutter/mecab_for_flutter-Swift.h>)
#import <mecab_for_flutter/mecab_for_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mecab_for_flutter-Swift.h"
#endif

@implementation MecabForFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMecabForFlutterPlugin registerWithRegistrar:registrar];
}
@end
