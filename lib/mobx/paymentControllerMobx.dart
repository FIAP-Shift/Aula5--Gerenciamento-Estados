import 'package:flutter_shift_estados/model/payment.dart';
import 'package:mobx/mobx.dart';

part 'paymentControllerMobx.g.dart';

class PaymentControllerMobx = PaymentControllerMobxBase with _$PaymentControllerMobx;

abstract class PaymentControllerMobxBase with Store {
  //action -> action
  //changeNotifier -> Store
  //changeNotifierProider -> MobX com o @observable
  //consumder -> ???

  @observable
  var payments = ObservableList();

  @action
  void add(Payment payment) {
    payments.add(payment);
  }

  @action
  void update(int index, Payment payment){
    payments.removeAt(index);
    payments.insert(index, payment);
  }
}
