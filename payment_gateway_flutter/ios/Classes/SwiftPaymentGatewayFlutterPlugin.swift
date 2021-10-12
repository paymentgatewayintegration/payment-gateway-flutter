import Flutter
import UIKit
import PaymentGatewaySwift

public class SwiftPaymentGatewayFlutterPlugin: NSObject, FlutterPlugin, PaymentGatewayDelegate {
  
  var paymentResult: FlutterResult?
    
let errorJSON = """
    {
     "status": "failed"
    }
    """
    
let successJSON = """
        {
         "status": "success",
         "payment_response":%@
        }
    """
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "payment_gateway_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftPaymentGatewayFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    paymentResult = result

    DispatchQueue.main.async {
      
        if let controller = UIApplication.shared.keyWindow?.rootViewController, let payload = call.arguments as? NSDictionary, let url = payload["url"] as? String, let params = payload["params"] as? NSDictionary{
            let paymentParams = PaymentGatewayParams(json: params)
         PaymentGateway.open(controller: controller, url: url, params: paymentParams, delegate: self)
      }
    }
  }
  
    public func didPaymentCompleted(_ controller: UIViewController, data: Any?) {
    DispatchQueue.main.async {
        if let paymentResponse = data as? String{
            let successJSON = String(format: self.successJSON, paymentResponse)
            self.paymentResult?(successJSON)
        }else{
            self.paymentResult?(self.errorJSON)
        }
        controller.dismiss(animated: true, completion: nil)
    }
  }
  
    public func didPaymentCanceled(_ controller: UIViewController) {
    DispatchQueue.main.async{
        self.paymentResult?(self.errorJSON)
        controller.dismiss(animated: true, completion: nil)
    }
  }


}


