import 'package:hive/hive.dart';

part 'customer.g.dart';

//! flutter packages pub run build_runner build

@HiveType(typeId: 2)
class Customer extends HiveObject {
  @HiveType(typeId: 0)
  String id;
  @HiveType(typeId: 1)
  String name;
  @HiveType(typeId: 2)
  String cel;
  @HiveType(typeId: 3)
  String email;
  @HiveType(typeId: 4)
  String responsible;
  @HiveType(typeId: 5)
  String comments;

  Customer(
      {this.id,
      this.name,
      this.cel,
      this.email,
      this.responsible,
      this.comments});

  // @override
  // String toString() => id;

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'cel': cel,
  //     'email': email,
  //     'responsible': responsible,
  //     'comments': comments
  //   };
  // }
}
