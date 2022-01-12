import 'package:intl/intl.dart';

DateTime strToDate(String stringDate) {
  if (stringDate == null) return null;
  return DateFormat("yyyy-MM-dd HH:mm").parse(stringDate);
}

String dateToStr(DateTime dateTimeDate) {
  if (dateTimeDate == null) return "";
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
  final String formatted = formatter.format(dateTimeDate);
  return formatted;
}

DateTime strBRToDate(String stringDate) {
  if (stringDate == null) return null;
  return DateFormat("dd/MM/yyyy").parse(stringDate);
}

DateTime strTimeBRToDate(String stringDate) {
  if (stringDate == null) return null;
  return DateFormat("HH:mm").parse(stringDate);
}

String dateToStrBR(DateTime dateTimeDate) {
  if (dateTimeDate == null) return "";
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(dateTimeDate);
  return formatted;
}

String dateToTimeStr(DateTime dateTimeDate) {
  if (dateTimeDate == null) return "00:00";
  final DateFormat formatter = DateFormat('HH:mm');
  final String formatted = formatter.format(dateTimeDate);
  return formatted;
}
