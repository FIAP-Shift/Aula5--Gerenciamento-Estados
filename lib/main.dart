import 'package:flutter/material.dart';
import 'package:flutter_shift_estados/listAccounts.dart';
import 'package:flutter_shift_estados/mobx/paymentControllerMobx.dart';
import 'package:flutter_shift_estados/provider/paymentControllerProvider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<PaymentControllerMobx>(
      PaymentControllerMobx()
  );
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
      //ChangeNotifierProvider tem englobar todas as classes
      //que possam ouvir mudanças no changeNotifier, ou seja,
      //atuarem como consumers
      //COM PROVIDER
      /*home: ChangeNotifierProvider(
        create: (context) => PaymentControllerProvider(),
        child: ListAccountsPage(),
      ),*/

      //COM MOBX
      home: ListAccountsPage()
    );
  }
}

