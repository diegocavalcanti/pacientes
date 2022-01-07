import 'package:get/get.dart';
import 'package:meuspacientes/models/customer.dart';
import 'package:meuspacientes/repos/customer_repo.dart';
import 'package:provider/provider.dart';

class CustomerController extends GetxController {
  final CustomerRepo repo = CustomerRepo();

  late List<Customer> customers;

  @override
  void onInit() {
    // Here you can fetch you product from server
    super.onInit();
    print("Buscando dados...");
    this.customers = repo.customers.obs();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Here, you can dispose your StreamControllers
    // you can cancel timers
    super.onClose();
  }
}
