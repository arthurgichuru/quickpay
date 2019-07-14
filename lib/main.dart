import 'package:flutter/material.dart';
import 'package:quickpay/LandingPage.dart';

void main()=> runApp(QuickPay());

class QuickPay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuickPay',
      theme: ThemeData(
        primaryColor: Colors.greenAccent
      ),
      initialRoute: '/',
      routes: {
           "/":(context)=> LogInPersonal(),

      },
    );
  }
}