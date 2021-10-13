# Paymentgateway Flutter

Flutter plugin for Paymentgateway SDK.

[![pub package](https://img.shields.io/pub/v/payment_gateway_flutter.svg)](https://pub.dev/packages/payment_gateway_flutter)

* [Getting Started](#getting-started)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Usage](#usage)
* [Example App](https://github.com/Paymentgateway/payment-gateway-flutter/tree/master/example)

## Getting Started

This flutter plugin is a wrapper around our Android and iOS SDKs.

The following documentation is only focused on the wrapper around our native Android and iOS SDKs. 


## Installation

This plugin is available on Pub: [https://pub.dev/packages/payment_gateway_flutter](https://pub.dev/packages/payment_gateway_flutter)

Add this to `dependencies` in your app's `pubspec.yaml`

```yaml
payment_gateway_flutter: ^1.2.3
```

**Note for Android**: Make sure that the minimum API level for your app is 19 or higher.


**Note for iOS**: Make sure that the minimum deployment target for your app is iOS 10.0 or higher. Also, This is not support **SIMULATOR** you can ruh real **iPhone** devices.

Run `flutter packages get` in the root directory of your app.

## Usage

Sample code to integrate can be found in [example/lib/main.dart](example/lib/main.dart).

#### Import package 

```dart
import 'package:payment_gateway_flutter/payment_gateway_flutter.dart';
```

#### Create Paymentgateway instance

```dart
PaymentGatewayFlutter.open(
          '<PAYMENT_URL>', request)
```

#### Accessing response

```dart

try {
     varresponse = await PaymentGatewayFlutter.open(
          '<PAYMENT_URL>', request);
      var r=jsonDecode(response);
      print(r['status']);
      print(r['payment_response']);

    } on PlatformException {
      
      }
    
```

#### Setup options

```dart
var options = {
  'key': '<YOUR_KEY_HERE>',
  'amount': 100,
  'name': '',
  }
};
```
