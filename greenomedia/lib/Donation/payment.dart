import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_app_sigma/response.dart';
import './response.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Payment Gateway",
            style: GoogleFonts.kaushanScript(
                letterSpacing: 5,
                shadows: [
                  Shadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(2, 3))
                ],
                color: Colors.green[900],
                fontSize: 30,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: openCheckout,
            child: Container(
              height: 200,
              width: 200,
              child: Center(
                child: Text("PROCEED TO PAYMENT",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kaushanScript(
                        letterSpacing: 5,
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(2, 3))
                        ],
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              decoration: BoxDecoration(
                color: Colors.lightGreen[100],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_wAXhdAl48q055k',
      'amount': 200000,
      'name': 'GreeonOMedia Donation',
      'description': 'For NGO',
      'prefill': {'contact': '9971715927', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _showDialog(int task, {String id}) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return task == 1
            ? DialogResponses(
                color: Colors.green[300],
                icon: Icons.check_circle,
                message: "Transaction\nSuccessfull",
                id: id,
              )
            : task == 2
                ? DialogResponses(
                    color: Colors.red,
                    icon: Icons.cancel,
                    message: "Transaction\nFailed",
                  )
                : DialogResponses(
                    color: Colors.amber,
                    icon: Icons.account_balance_wallet,
                    message: "Selected\nExternal Wallet",
                  );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _showDialog(1, id: response.paymentId);
    //Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName);
  }
}
