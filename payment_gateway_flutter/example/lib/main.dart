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
                      child: Text('Pay'),
                      onPressed: () {
                        Map<String, dynamic> request ={};
                        request['country']= "India";
                        request['amount']= "10";
                        request['city']= "TN";
                        request['description']= "description";
                        request['zip_code']= "123456";
                        request['api_key']= "<API_KEY>";
                        request['phone']= "123567890";
                        request['name']= "name";
                        request['address_line_1']= "ad1";
                        request['address_line_2']= "ad2";
                        request['return_url']= "return_url";
                        request['currency']= "IND";
                        request['state']= "TN";
                        request['order_id']= "order_id";
                        request['email']= "email";
                        request['hash']= "hash";
                        request['mode']="TEST";
                        requestToPay(request, context);
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

  void requestToPay(Map<String, dynamic> request, BuildContext context) async {
    try {
      response = await PaymentGatewayFlutter.open(
          'https://pgbizbatchsync.omniware.in/', request);
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
