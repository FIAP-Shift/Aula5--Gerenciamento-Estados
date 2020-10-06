import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_shift_estados/firebaseNotifications.dart';
import 'package:flutter_shift_estados/mobx/paymentControllerMobx.dart';
import 'package:flutter_shift_estados/model/payment.dart';
import 'package:flutter_shift_estados/provider/paymentControllerProvider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

/*
publisher -> channel -> subscriber
changeNotifier -> changeNotifierProvider -> consumer
invokeMethod -> methodChannel -> callHandler
 */

class ListAccountsPage extends StatelessWidget {

  //com MobX, precisa instanciar o Controller
  PaymentControllerMobx paymentController;

  ListAccountsPage(){
    paymentController = GetIt.I.get<PaymentControllerMobx>();
  }

  @override
  Widget build(BuildContext context) {
    new FirebaseNotifications().setUpFirebase();

    return Scaffold(
        appBar: AppBar(
          title: Text("Contas a pagar"),
        ),
        //com Provider, usamos o Consumer
        //body: Consumer<PaymentControllerProvider>(
        //    builder: (context, controller, child) {
        //com MobX, o Observer
        body: Observer(
            builder: (_) {
              return paymentController.payments.length == 0 ?
              withoutPayments() :
              DataTable(
                columns: <DataColumn>[
                  getColumn('Tipo'),
                  getColumn('Local'),
                  getColumn('Valor'),
                ],
                rows: getRows(paymentController),
              );
            }
        )
    );
  }

  DataColumn getColumn(String label) => DataColumn(
      label: Text(label)
  );

  Widget withoutPayments() => Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "Nenhuma conta recebida neste momento...",
        style: TextStyle(
            fontSize: 25
        ),
      )
  );

  //List<DataRow> getRows(PaymentControllerProvider controller){
  List<DataRow> getRows(PaymentControllerMobx controller){
    List<DataRow> rows = List();

    for (int index = 0; index < controller.payments.length; index++){
      Payment element = controller.payments[index];
      rows.add(
          DataRow(
            selected: element.selected,
            cells: <DataCell>[
              DataCell(Text(element.type)),
              DataCell(Text(element.place)),
              DataCell(Text("${element.value}")),
            ],
            onSelectChanged: (value) {
              element.selected = value;
              controller.update(index, element);
            },
          )
      );
    }

    return rows;
  }

}
