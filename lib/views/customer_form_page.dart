import 'package:flutter/material.dart';
import 'package:meuspacientes/controllers/customer_controller.dart';
import 'package:meuspacientes/models/customer.dart';
import 'package:provider/provider.dart';

class CustomerFormPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Customer customer;
  CustomerFormPage(this.customer);

  Widget fieldName(Customer c) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe algum valor';
        }
        return null;
      },
      onSaved: (newValue) => {c.name = newValue},
      initialValue: c.name,
      decoration: InputDecoration(labelText: "Nome:"),
    );
  }

  Widget fieldCel(Customer c) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe algum valor';
        }
        return null;
      },
      onSaved: (newValue) => {c.cel = newValue},
      initialValue: c.cel,
      decoration: InputDecoration(labelText: "Celular:"),
    );
  }

  Widget fieldResponsible(Customer c) {
    return TextFormField(
      onSaved: (newValue) => {c.responsible = newValue},
      initialValue: c.responsible,
      decoration: InputDecoration(labelText: "Resonsável:"),
    );
  }

  Widget fieldEmail(Customer c) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe algum valor';
        } else if (!value.contains('@')) {
          return 'O e-mail deve possuir @.';
        }
        return null;
      },
      onSaved: (newValue) => {c.email = newValue},
      initialValue: c.email,
      decoration: InputDecoration(labelText: "Email:"),
    );
  }

  @override
  Widget build(BuildContext context) {
    CustomerController controller =
        Provider.of<CustomerController>(context, listen: true);

    return Scaffold(
        appBar: AppBar(title: Text('Cadastro de Clientes'), actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_form.currentState.validate()) {
                  _form.currentState.save();
                  controller.save(context, customer);
                }
              })
        ]),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _form,
                child: Column(
                  children: [
                    fieldName(customer),
                    fieldCel(customer),
                    fieldEmail(customer),
                    fieldResponsible(customer),
                  ],
                ))));
  }
}
