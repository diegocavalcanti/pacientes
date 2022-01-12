class Customer {
  int id;
  String name;
  String cel;
  String email;
  String? responsible;
  String? comments;
  
  Customer(
      {required this.id,
      required this.name,
      required this.cel,
      required this.email,
      this.responsible,
      this.comments});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cel': cel,
      'email': email,
      'responsible': responsible,
      'comments': comments
    };
  }

  @override
  String toString() {
    return 'Customer{id: $id, name: $name}';
  }
}
