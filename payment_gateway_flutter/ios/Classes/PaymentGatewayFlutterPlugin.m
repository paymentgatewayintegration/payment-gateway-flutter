#import "PaymentGatewayFlutterPlugin.h"
#if __has_include(<payment_gateway_flutter/payment_gateway_flutter-Swift.h>)
#import <payment_gateway_flutter/payment_gateway_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "payment_gateway_flutter-Swift.h"
#endif

@implementation PaymentGatewayFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPaymentGatewayFlutterPlugin registerWithRegistrar:registrar];
}
@end
