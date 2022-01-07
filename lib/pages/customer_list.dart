import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meuspacientes/controllers/customer_controller.dart';
import 'package:meuspacientes/models/customer.dart';

class CustomerListPage extends StatelessWidget {
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomerController controller = Get.put(CustomerController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: GetBuilder(
              init: CustomerController(),
              builder: (value) =>
                  Text('Listagem de Pacientes ${controller.customers.length}')),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //          _onShowFormPaciente(context, repo);
          },
        ),
        body: Container(
          child: ListView.builder(
              itemCount: controller.customers.length,
              itemBuilder: (context, index) {
                var customer = controller.customers[index];
                return ListTile(
                  leading: Icon(
                    Icons.person_rounded,
                    color: Colors.blue,
                  ),
                  title: Text(customer.name),
                  subtitle: Row(
                    children: [
                      Text(customer.cel),
                    ],
                  ),
                  onTap: () => _onSelectPaciente(context, customer),
                  trailing: InkWell(
                    child: const Icon(Icons.more_vert),
                    onTap: () => _opcoes(context, customer),
                    // margin: EdgeInsets.only(top: 25.0),
                  ),
                );
              }),
        ),
      ),
    );
  }

  _onSelectPaciente(BuildContext context, Customer customer) {}

  _opcoes(BuildContext context, Customer customer) {}

  // void _opcoes(BuildContext context, PacientStore store, PacientModel paciente) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         color: const Color(0xFF737373),
  //         height: 180,
  //         child: Container(
  //           child: Column(
  //             children: [
  //               ListTile(
  //                 leading: Icon(Icons.delete),
  //                 title: Text("Excluir"),
  //                 onTap: () => _onRemovePaciente(context, store, paciente),
  //               ),
  //               ListTile(
  //                 leading: Icon(Icons.edit),
  //                 title: Text("Editar"),
  //                 onTap: () => _onSelectPaciente(context, store, paciente),
  //               ),
  //             ],
  //           ),
  //           decoration: BoxDecoration(
  //               color: Theme.of(context).canvasColor,
  //               borderRadius: BorderRadius.only(
  //                 topLeft: const Radius.circular(10),
  //                 topRight: const Radius.circular(10),
  //               )),
  //         ),
  //       );
  //     },
  //   );
  // }

  // void _onShowFormPaciente(BuildContext context, PacientStore store) {
  //   push(context, PacientFormPage(PacientModel()));
  // }

  // void _onSelectPaciente(BuildContext context, PacientStore store, PacientModel paciente) {
  //   push(context, PacientFormPage(paciente));
  // }

  // void _onRemovePaciente(BuildContext context, PacientStore store, PacientModel paciente) {
  //   alertConfirm(context, "Remover", 'Deseja remover o paciente?', confirmCallback: () {
  //     store.remove(paciente);
  //     Navigator.pop(context);
  //   });
  // }
}
