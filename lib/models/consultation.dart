import 'package:meuspacientes/utils/date_utils.dart';

class Consulation {
  int id;
  DateTime date = DateTime.now();
  List<String> assets = [];

  Consulation({this.id, this.date});

  Map<String, dynamic> toMap() {
    return {'id': id, 'date': dateToStr(date), 'assets': assets};
  }

  @override
  String toString() {
    return 'Consulation{id: $id, date: $date}';
  }
}
