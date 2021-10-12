
import 'dart:async';

import 'package:flutter/services.dart';

class PaymentGatewayFlutter {
  static const MethodChannel _channel =
      const MethodChannel('payment_gateway_flutter');

  static Future<String?> open(String url, dynamic params) async {
    final String? version = await _channel.invokeMethod('open', {'url':url, 'params': params});
    return version;
  }
}
