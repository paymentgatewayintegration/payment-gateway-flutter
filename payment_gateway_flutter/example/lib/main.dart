// @dart=2.9
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_gateway_flutter/payment_gateway_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _AppState(),
    );
  }
}

class _AppState extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_AppState> {
  dynamic response;
  String paymentResponse = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Payment Gateway'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Welcome Payment Gateway',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Pay Now'),
                      onPressed: () {
                    // For payment parammeters to refer 
                    //https://pgandroidintegrations.docs.stoplight.io/request-param-list
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
                    // Initiate payemnt
                    open(params, context);
                      },
                    )),
                if (paymentResponse.isNotEmpty)
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Payment Response : ' + paymentResponse,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ))
              ],
            )),
      ),
    );
  }

  void open(Map<String, dynamic> request, BuildContext context) async {
    try {
      response = await PaymentGatewayFlutter.open(
          '<PAYMENT_API_URL>', request);
      // Response Handling
      //Please refre this url for reponse code https://pgandroidintegrations.docs.stoplight.io/response-codes
      var r=jsonDecode(response);
      print(r['status']);
      print(r['payment_response']);

    } on PlatformException {
      response = 'Failed to get initiate.';
    }
    setState(() {
      paymentResponse = response;
    });
  }


}
