import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateway extends GetxController {
  Razorpay razorpay;
  @override
  void onInit() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleError);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccess);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.onInit();
  }

  void handleError(PaymentFailureResponse paymentFailureResponse) {
    Get.snackbar("Error Occured", paymentFailureResponse.message);
  }

  void handleSuccess(PaymentSuccessResponse paymentSuccessResponse) {
    Get.snackbar("Payment Successful", paymentSuccessResponse.orderId);
  }

  void handleExternalWallet(ExternalWalletResponse externalWalletResponse) {
    Get.snackbar("Wallet", externalWalletResponse.walletName);
  }

  void dispatchPayment(
      int amount, String name, int contact, String email, String wallet) {
    var options = {
      'key': 'rzp_test_kmnQicmBI7HoCV',
      'amount': amount,
      'name': name,
      'description': 'Payment',
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': [wallet]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }
}
