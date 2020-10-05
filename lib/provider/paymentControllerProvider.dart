import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_shift_estados/model/payment.dart';

//classe ser filha de ChangeNotifier é um ponto crucial
class PaymentControllerProvider extends ChangeNotifier {
  final List<Payment> _payments = [];

  UnmodifiableListView<Payment> get items => UnmodifiableListView(_payments);

  void add(Payment payment) {
    _payments.add(payment);

    //inicia o processo de avisar o changeNotifierProvider, que, por sua vez
    //notifica os N consumidores
    notifyListeners();
  }

  void update(){
    notifyListeners();
  }
}
