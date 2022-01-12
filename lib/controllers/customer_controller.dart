import 'package:flutter/cupertino.dart';
import 'package:meuspacientes/utils/nav.dart';
import '../models/customer.dart';
import '../dao/customer_dao.dart';
import '../views/customer_form_page.dart';

class CustomerController extends ChangeNotifier {
  final CustomerDao _repo = CustomerDao();

  List<Customer> getCustomers() {
    return _repo.customers;
  }

  void save(BuildContext context, Customer customer) {
    _repo.save(customer);
    Navigator.of(context).pop();
    notifyListeners();
  }

  void goToFormNew(BuildContext context) {
    Customer c = Customer();
    goTo(context, CustomerFormPage(c));
  }

  void goToPageEdit(BuildContext context, Customer customer) {
    goTo(context, CustomerFormPage(customer));
  }

  void remove(BuildContext context, Customer customer) {
    _repo.remove(customer.id);
    Navigator.of(context).pop();
    notifyListeners();
  }
}
