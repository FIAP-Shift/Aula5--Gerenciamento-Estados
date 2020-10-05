import 'package:flutter/material.dart';
import 'package:flutter_shift_estados/firebaseNotifications.dart';
import 'package:flutter_shift_estados/model/payment.dart';
import 'package:flutter_shift_estados/provider/paymentControllerProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => PaymentControllerProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  List<Payment> payments = List();

  @override
  void initState() {
    super.initState();
    new FirebaseNotifications(useMessage).setUpFirebase();
  }

  //função de callback
  void useMessage(Payment payment){
    setState(() {
      payments.add(payment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contas a pagar"),
      ),
      body: payments.length == 0 ? Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Nenhuma conta recebida neste momento...",
            style: TextStyle(
                fontSize: 25
            ),
          )
      ):
      DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Tipo',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Local',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Valor',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: getRows(),
      ),
    );
  }

  List<DataRow> getRows(){
    List<DataRow> rows = List();

    payments.forEach((element) {
      rows.add(
          DataRow(
            selected: element.selected,
            cells: <DataCell>[
              DataCell(Text(element.type)),
              DataCell(Text(element.place)),
              DataCell(Text("${element.value}")),
            ],
            onSelectChanged: (value) {
              setState(() {
                element.selected = value;
              });
            },
          )
      );
    });
    return rows;
  }

}
