package com.example.payment_gateway_flutter

import android.app.Activity
import android.os.Looper
import androidx.annotation.NonNull
import com.mobile.pgv1.PaymentGatewayInitializer
import com.mobile.pgv1.PaymentParams
import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import org.json.JSONException
import org.json.JSONObject
import android.os.Handler
import android.util.Log

/** PaymentGatewayFlutterPlugin */
class PaymentGatewayFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel


  lateinit var activity: Activity

  private val uiThreadHandler: Handler = Handler(Looper.getMainLooper())

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "payment_gateway_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity as FlutterActivity
        channel.setMethodCallHandler { call, result ->
            if (call.method.equals("open")) {
                val pgPaymentParams = PaymentParams(call.argument("params"))
                val pgPaymentInitialzer = PaymentGatewayInitializer(call.argument("url"), pgPaymentParams, activity)
                pgPaymentInitialzer.initiatePaymentProcess { paymentResponse ->
                    uiThreadHandler.post {
                        result.success(paymentResponse)
                    }
                }
            } else {
                result.notImplemented()
            }
        }
    }
    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {    
    }

    override fun onDetachedFromActivity() {
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
