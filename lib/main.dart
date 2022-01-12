// @dart=2.9
import 'package:flutter/material.dart';
import 'package:meuspacientes/controllers/customer_controller.dart';
import 'views/customer_list_page.dart';
import 'views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CustomerController())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Gestão de Pacientes',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
