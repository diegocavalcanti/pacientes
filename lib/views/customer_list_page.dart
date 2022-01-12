import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meuspacientes/controllers/customer_controller.dart';
import 'package:meuspacientes/models/customer.dart';
import 'package:provider/provider.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({Key key}) : super(key: key);

  Widget iconEditButton(Function() onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function() remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    CustomerController controller =
        Provider.of<CustomerController>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Pacientes")),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              controller.goToFormNew(context);
            }),
        body: Container(
          child: ListView.builder(
              itemCount: controller.getCustomers().length,
              itemBuilder: (context, index) {
                var customer = controller.getCustomers()[index];
                return ListTile(
                  // ignore: prefer_const_constructors
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  title: Text(customer.name ?? ''),
                  subtitle: Row(
                    children: [
                      Text(customer.cel ?? ''),
                    ],
                  ),
                  onTap: () => controller.goToPageEdit(context, customer),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        iconRemoveButton(context, () {
                          controller.remove(context, customer);
                        }),
                        iconEditButton(() {
                          controller.goToPageEdit(context, customer);
                        }),
                      ],
                    ),
                  ),
                  // trailing: InkWell(
                  //   child: const Icon(Icons.more_vert),
                  //   onTap: () => _opcoes(context, customer),
                  // ),
                );
              }),
        ),
      ),
    );
  }

  void _opcoes(BuildContext context, Customer customer) {
    CustomerController controller =
        Provider.of<CustomerController>(context, listen: false);

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: const Color(0xFF737373),
          height: 180,
          child: Container(
            child: Column(
              children: [
                ListTile(
                    leading: Icon(Icons.delete),
                    title: Text("Excluir"),
                    onTap: () => controller.remove(context, customer)),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("Editar"),
                  onTap: () => controller.goToPageEdit(context, customer),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                )),
          ),
        );
      },
    );
  }
}
