import 'package:uuid/uuid.dart';

String uuid() {
  var uuid = Uuid();
  return uuid.v4();
}
