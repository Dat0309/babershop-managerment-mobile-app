import 'package:flutter/cupertino.dart';

enum CheckoutState { nomal, cart }

class AnimController extends ChangeNotifier {
  CheckoutState checkoutState = CheckoutState.nomal;

  void changeCheckoutState(CheckoutState state) {
    checkoutState = state;
    notifyListeners();
  }
}
