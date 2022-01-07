import 'package:flutter/material.dart';
import 'package:meuspacientes/database/db.dart';
import 'package:sqflite/sqflite.dart';
import '../models/customer.dart';
import 'dart:collection';

class CustomerRepo {
  static const tableName = 'customer';

  List<Customer> _listCustomer = [];

  UnmodifiableListView<Customer> get customers =>
      UnmodifiableListView(_listCustomer);

  CustomerRepo() {
    initRepo();
  }

  void save(Customer entity) async {
    Database db = await DB.instance.get();
    await db.insert(
      tableName,
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  initRepo() async {
    // Database db = await DB.instance.get();

    // //* give values from database.
    // final List<Map<String, dynamic>> maps = await db.query(tableName);

    // //* store var list entitys
    // _listCustomer = List.generate(maps.length, (i) {
    //   return Customer(
    //     id: maps[i]['id'],
    //     name: maps[i]['name'],
    //     cel: maps[i]['cel'],
    //     comments: maps[i]['comments'],
    //   );
    // });

    _listCustomer.add(Customer(
        id: 1,
        name: "Diego Daniel",
        cel: "(67) 99152-0703",
        comments: "Cliente Especial"));

    _listCustomer.add(Customer(
        id: 1,
        name: "Gabriela Beatriz",
        cel: "(67) 99247-3025",
        comments: "Cliente Super"));

    print('Total Registros:' + _listCustomer.length.toString());
  }

  Future<void> update(Customer entity) async {
    Database db = await DB.instance.get();

    //* Update the given Entity.
    await db.update(
      tableName,
      entity.toMap(),
      //* Ensure that the Dog has a matching id.
      where: 'id = ?',
      //* Pass the Entiy id as a whereArg to prevent SQL injection.
      whereArgs: [entity.id],
    );
  }

  Future<void> remove(int id) async {
    Database db = await DB.instance.get();

    //* Update the given Entity.
    await db.delete(
      tableName,
      //* Use a `where` clause to delete a specific entity.
      where: 'id = ?',
      //* Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
