// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meuspacientes/controllers/customer_controller.dart';
import 'package:meuspacientes/utils/constants.dart';
import 'package:provider/provider.dart';

import 'models/customer.dart';
import 'views/home_page.dart';

void main() async {
  //*init hive
  WidgetsFlutterBinding.ensureInitialized();
  //final applicationDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  await Hive.registerAdapter(CustomerAdapter());
  //await Hive.openBox(boxCustomers);
  //await Hive.openBox(boxConsulations);

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
