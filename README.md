# Paymentgateway Flutter

Flutter plugin for Paymentgateway SDK.

[![pub package](https://img.shields.io/pub/v/payment_gateway_flutter.svg)](https://pub.dev/packages/payment_gateway_flutter)

* [Getting Started](#getting-started)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Usage](#usage)
* [Troubleshooting](#troubleshooting)
* [API](#api)
* [Example App](https://github.com/Paymentgateway/Paymentgateway-flutter/tree/master/example)

## Getting Started

This flutter plugin is a wrapper around our Android and iOS SDKs.

The following documentation is only focused on the wrapper around our native Android and iOS SDKs. To know more about our SDKs and how to link them within the projects, refer to the following documentation:

**Android**: [https://Paymentgateway.com/docs/checkout/android/](https://Paymentgateway.com/docs/checkout/android/)

**iOS**: [https://Paymentgateway.com/docs/ios/](https://Paymentgateway.com/docs/ios/)

To know more about Paymentgateway payment flow and steps involved, read up here: [https://Paymentgateway.com/docs/](https://Paymentgateway.com/docs/)

## Prerequisites

 - Learn about the <a href="https://Paymentgateway.com/docs/payment-gateway/payment-flow/" target="_blank">Paymentgateway Payment Flow</a>.
 - Sign up for a <a href="https://dashboard.Paymentgateway.com/#/access/signin">Paymentgateway Account</a> and generate the <a href="https://Paymentgateway.com/docs/payment-gateway/dashboard-guide/settings/#api-keys/" target="_blank">API Keys</a> from the Paymentgateway Dashboard. Using the Test keys helps simulate a sandbox environment. No actual monetary transaction happens when using the Test keys. Use Live keys once you have thoroughly tested the application and are ready to go live.
 

## Installation

This plugin is available on Pub: [https://pub.dev/packages/Paymentgateway_flutter](https://pub.dev/packages/Paymentgateway_flutter)

Add this to `dependencies` in your app's `pubspec.yaml`

```yaml
Paymentgateway_flutter: ^1.2.3
```

**Note for Android**: Make sure that the minimum API level for your app is 19 or higher.

### Proguard rules
If you are using proguard for your builds, you need to add following lines to proguard files
```
-keepattributes *Annotation*
-dontwarn com.Paymentgateway.**
-keep class com.Paymentgateway.** {*;}
-optimizations !method/inlining/
-keepclasseswithmembers class * {
  public void onPayment*(...);
}
```

Follow [this](https://github.com/Paymentgateway/Paymentgateway-flutter/issues/42#issuecomment-550161626) for more details.

**Note for iOS**: Make sure that the minimum deployment target for your app is iOS 10.0 or higher. Also, don't forget to enable bitcode for your project.

Run `flutter packages get` in the root directory of your app.

## Usage

Sample code to integrate can be found in [example/lib/main.dart](example/lib/main.dart).

#### Import package 

```dart
import 'package:Paymentgateway_flutter/Paymentgateway_flutter.dart';
```

#### Create Paymentgateway instance

```dart
_Paymentgateway = Paymentgateway();
```

#### Attach event listeners

The plugin uses event-based communication, and emits events when payment fails or succeeds.

The event names are exposed via the constants `EVENT_PAYMENT_SUCCESS`, `EVENT_PAYMENT_ERROR` and `EVENT_EXTERNAL_WALLET` from the `Paymentgateway` class.

Use the `on(String event, Function handler)` method on the `Paymentgateway` instance to attach event listeners.

```dart

_Paymentgateway.on(Paymentgateway.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
_Paymentgateway.on(Paymentgateway.EVENT_PAYMENT_ERROR, _handlePaymentError);
_Paymentgateway.on(Paymentgateway.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
```

The handlers would be defined somewhere as

```dart

void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Do something when payment succeeds
}

void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet was selected
}
```

To clear event listeners, use the `clear` method on the `Paymentgateway` instance.

```dart
_Paymentgateway.clear(); // Removes all listeners
```

#### Setup options

```dart
var options = {
  'key': '<YOUR_KEY_HERE>',
  'amount': 100,
  'name': 'Acme Corp.',
  'description': 'Fine T-Shirt',
  'prefill': {
    'contact': '8888888888',
    'email': 'test@Paymentgateway.com'
  }
};
```

A detailed list of options can be found [here](https://Paymentgateway.com/docs/payment-gateway/integrations-guide/checkout/standard/#checkout-form).

#### Open Checkout

```dart
_Paymentgateway.open(options);
```
