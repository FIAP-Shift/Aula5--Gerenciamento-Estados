import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shift_estados/model/payment.dart';
import 'package:flutter_shift_estados/provider/paymentControllerProvider.dart';
import 'package:provider/provider.dart';

class FirebaseNotifications {

  BuildContext context;
  PaymentControllerProvider controller;
  FirebaseMessaging _firebaseMessaging;

  FirebaseNotifications(this.context){
    //estamos usando o ChangeNotifer como action
    controller = Provider.of<PaymentControllerProvider>(context, listen: false);
  }

  void setUpFirebase() {
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token) {
      print("token: $token");
    });

    _firebaseMessaging.configure(
      //só ouvimos push com o app em primeiro plano
      onMessage: (Map<String, dynamic> message) async {
        print("on message $message");
        Payment payment = Payment.fromJson(message);
        controller.add(payment);
      },
      onResume: (Map<String, dynamic> message) async {},
      onLaunch: (Map<String, dynamic> message) async {},
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}
