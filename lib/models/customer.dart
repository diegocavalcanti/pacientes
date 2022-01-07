class Customer {
  final int id;
  final String name;
  final String cel;
  final String comments;
  // !exemplo com lista List<Titulo> titulos = [];

  Customer(
      {required this.id,
      required this.name,
      required this.cel,
      required this.comments});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'cel': cel, 'comments': comments};
  }

  @override
  String toString() {
    return 'Customer{id: $id, name: $name, cel : $cel, comments: $comments }';
  }
}
