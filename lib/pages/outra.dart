import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer_controller.dart';

class Outra extends StatelessWidget {
  Outra({Key? key}) : super(key: key);

  // Você pode pedir o Get para encontrar o controller que foi usado em outra página e redirecionar você pra ele.
  final CustomerController c = Get.find();
  @override
  Widget build(context) =>
      Scaffold(body: Center(child: Text("${c.customers}")));
}
