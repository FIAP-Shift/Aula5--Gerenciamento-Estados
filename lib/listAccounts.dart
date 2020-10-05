import 'package:flutter/material.dart';
import 'package:flutter_shift_estados/firebaseNotifications.dart';
import 'package:flutter_shift_estados/provider/paymentControllerProvider.dart';
import 'package:provider/provider.dart';

/*
publisher -> channel -> subscriber
changeNotifier -> changeNotifierProvider -> consumer
invokeMethod -> methodChannel -> callHandler
 */

class ListAccountsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    new FirebaseNotifications(context).setUpFirebase();

    return Scaffold(
        appBar: AppBar(
          title: Text("Contas a pagar"),
        ),
        body: Consumer<PaymentControllerProvider>(
            builder: (context, controller, child) {
              return controller.items.length == 0 ?
              withoutPayments() :
              DataTable(
                columns: <DataColumn>[
                  getColumn('Tipo'),
                  getColumn('Local'),
                  getColumn('Valor'),
                ],
                rows: getRows(controller),
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

  List<DataRow> getRows(PaymentControllerProvider controller){
    List<DataRow> rows = List();

    controller.items.forEach((element) {
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
              controller.update();
            },
          )
      );
    });
    return rows;
  }

}
