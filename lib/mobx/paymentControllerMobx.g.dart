// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentControllerMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentControllerMobx on PaymentControllerMobxBase, Store {
  final _$paymentsAtom = Atom(name: 'PaymentControllerMobxBase.payments');

  @override
  ObservableList<dynamic> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(ObservableList<dynamic> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  final _$PaymentControllerMobxBaseActionController =
      ActionController(name: 'PaymentControllerMobxBase');

  @override
  void add(Payment payment) {
    final _$actionInfo = _$PaymentControllerMobxBaseActionController
        .startAction(name: 'PaymentControllerMobxBase.add');
    try {
      return super.add(payment);
    } finally {
      _$PaymentControllerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(int index, Payment payment) {
    final _$actionInfo = _$PaymentControllerMobxBaseActionController
        .startAction(name: 'PaymentControllerMobxBase.update');
    try {
      return super.update(index, payment);
    } finally {
      _$PaymentControllerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payments: ${payments}
    ''';
  }
}