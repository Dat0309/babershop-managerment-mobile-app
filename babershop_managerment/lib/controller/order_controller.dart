// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/controller/cart_controller.dart';
import 'package:babershop_managerment/models/OrderModel.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/services/reposiitory/order_repo.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;
  OrderController({
    required this.orderRepo,
  });

  List<dynamic> orders = [];
  List<dynamic> userOrders = [];

  Order? order;
  CartController cartController = Get.find();
}
