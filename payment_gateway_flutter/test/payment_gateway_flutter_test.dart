import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment_gateway_flutter/payment_gateway_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('payment_gateway_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await PaymentGatewayFlutter.platformVersion, '42');
  });
}
