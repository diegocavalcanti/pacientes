import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/customer_controller.dart';

import 'customer_list.dart';
import 'outra.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Pagina Inicial "))),
      body: Center(
          child: ElevatedButton(
              child: Text("Lista Clientes"),
              onPressed: () => Get.to(CustomerListPage()))),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () => {}),
    );
  }
}
