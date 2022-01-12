import 'dart:collection';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:meuspacientes/database/db.dart';
import 'package:meuspacientes/utils/constants.dart';
import 'package:meuspacientes/utils/utils.dart';
import 'package:sqflite/sqflite.dart';

import '../models/customer.dart';

class CustomerDao {
  List<Customer> _listCustomer = [];
  LazyBox box;

  UnmodifiableListView<Customer> get customers =>
      UnmodifiableListView(_listCustomer);

  CustomerDao() {
    _startRepository();
  }

  _startRepository() async {
    box = await Hive.openLazyBox<Customer>(boxCustomers);
    await _readData();
  }

  _readData() {
    box.keys.forEach((customer) async {
      Customer c = await box.get(customer);
      _listCustomer.add(c);
    });
    print('${_listCustomer}');
  }

  void save(Customer entity) {
    entity.id = uuid();
    print('save ${entity}');
    box.put(entity.id, entity);
    _readData();
  }

  void update(Customer entity) {
    box.put(entity.id, entity);
    _readData();
  }

  void remove(String id) {
    box.delete(id);
    _readData();
  }
}
