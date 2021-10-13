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


**Note for iOS**: Make sure that the minimum deployment target for your app is iOS 10.0 or higher. Also, This is not support **SIMULATOR** you can run onlly in real **iPhone** devices.

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

#### Passing Payment params and URL

```dart
// For payment parammeters to refer 
// https://pgandroidintegrations.docs.stoplight.io/request-param-list

var params = {
'api_key': '<API_KEY>',
'hash': '<HASH_KEY>',
'order_id': 'TEST4000',
'mode': 'LIVE',
'description': 'Test',
'currency': 'INR',
'amount': '2',
'name': 'Senthil',
'email': 'emailsenthil@test.com',
'phone': '9597403366',
'city': 'Chennai',
'state': 'Tamilnadu',
'country': 'IND',
'zip_code': '630501',
'address_line_1': 'ad1',
'address_line_2': 'ad2',
'return_url': 'http://localhost:8888/paymentresponse'};

PaymentGatewayFlutter.open(
          '<PAYMENT_URL>', params)
```

#### Accessing response

```dart

response = await PaymentGatewayFlutter.open(
          '<PAYMENT_API_URL>', request);
      // Response Handling
      //Please refre this url for reponse code https://pgandroidintegrations.docs.stoplight.io/response-codes
      var r=jsonDecode(response);
      print(r['status']);
      print(r['payment_response']);
    
```
