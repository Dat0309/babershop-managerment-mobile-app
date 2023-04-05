// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:babershop_managerment/controller/booking_controller.dart';
import 'package:babershop_managerment/models/CartModel.dart';
import 'package:babershop_managerment/models/OrderModel.dart';
import 'package:babershop_managerment/models/statisticsModel.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/services/reposiitory/order_repo.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;
  OrderController({
    required this.orderRepo,
  });

  List<dynamic> orders = [];
  List<dynamic> baberOrdersByAdmin = [];
  List<dynamic> staffOrderByAdmin = [];
  List<dynamic> baberOrderByStaff = [];
  List<dynamic> staffOrderByStaff = [];
  List<dynamic> baberAllOrderByStaff = [];
  List<Map<String, dynamic>> staffSalary = [];

  Order? order;
  StatistiscModel? statistiscModel = StatistiscModel();
  StatistiscModel? statistiscModelShop1 = StatistiscModel();
  StatistiscModel? statistiscModelShop2 = StatistiscModel();
  BookingController bookingController = Get.find();

  bool isLoadedOrders = false;
  bool adminLoadedBaberOrder = false;
  bool adminLoadedStaffOrder = false;
  bool staffLoadedBaberOrder = false;
  bool staffLoadedAllBaberOrder = false;
  bool staffLoadedOrder = false;
  bool isCreated = false;
  bool isLoadedStaffSalary = false;
  bool isLoadedAdminStatistics = false;

  Future<void> adminGetAllSalary() async {
    isLoadedStaffSalary = false;
    await orderRepo.getAllStaffSalary().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['staffSalary'].length > 0) {
          staffSalary.clear();
          for (int i = 0; i < res['staffSalary'].length; i++) {
            if (res['staffSalary'][i] != null) {
              Map<String, dynamic> map = res['staffSalary'][i];
              staffSalary.add(map);
            }
          }
          isLoadedStaffSalary = true;
          update();
        }
      } else {}
    });
  }

  Future<void> adminStatistics() async {
    isLoadedAdminStatistics = false;

    await orderRepo.adminStatistics().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['statistics'] != null) {
          statistiscModel = StatistiscModel.fromMap(res['statistics']);
          update();
        }
      } else {}
    });

    await orderRepo
        .adminStatisicsById("64056512ad05bb43ae0d0e02")
        .then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);
        if (res['statistics'] != null) {
          statistiscModelShop2 = StatistiscModel.fromMap(res['statistics']);
          update();
        }
      } else {}
    });

    await orderRepo
        .adminStatisicsById("64056512ad05bb43ae0d0e01")
        .then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);
        if (res['statistics'] != null) {
          statistiscModelShop1 = StatistiscModel.fromMap(res['statistics']);
          update();
        }
      } else {}
    });

    if (statistiscModel != null &&
        statistiscModelShop1 != null &&
        statistiscModelShop2 != null) {
      isLoadedAdminStatistics = true;
      update();
    }
  }

  Future<void> adminGetAllOrderOfBabershop(String id) async {
    adminLoadedBaberOrder = false;
    await orderRepo.adminGetBabershopOrder(id).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['order'].length > 0) {
          baberOrdersByAdmin.clear();
          for (int i = 0; i < resData['order'].length; i++) {
            if (resData['order'][i] != null) {
              Map<String, dynamic> map = resData['order'][i];
              baberOrdersByAdmin.add(Order.fromMap(map));
            }
          }
          adminLoadedBaberOrder = true;
          update();
        }
      }
    });
  }

  Future<void> adminGetAllOrder() async {
    isLoadedOrders = false;
    await orderRepo.adminGetAllOrders().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['orders'].length > 0) {
          orders.clear();
          for (int i = 0; i < res['orders'].length; i++) {
            if (res['orders'][i] != null) {
              Map<String, dynamic> map = res['orders'][i];
              orders.add(Order.fromMap(map));
            }
          }
          isLoadedOrders = true;
          update();
        }
      } else {}
    });
  }

  Future<void> adminGetAllOrderOfStaff(String id) async {
    adminLoadedStaffOrder = false;
    await orderRepo.adminGetStaffOrder(id).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['order'].length > 0) {
          staffOrderByAdmin.clear();
          for (int i = 0; i < resData['order'].length; i++) {
            if (resData['order'][i] != null) {
              Map<String, dynamic> map = resData['order'][i];
              staffOrderByAdmin.add(Order.fromMap(map));
            }
          }
          adminLoadedStaffOrder = true;
          update();
        }
      }
    });
  }

  Future<void> staffGetAllOrderIOfThem() async {
    staffLoadedOrder = false;
    await orderRepo.staffGetAllOrders().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['order'].length > 0) {
          staffOrderByStaff.clear();
          for (int i = 0; i < resData['order'].length; i++) {
            if (resData['order'][i] != null) {
              Map<String, dynamic> map = resData['order'][i];
              staffOrderByStaff.add(Order.fromMap(map));
            }
          }
          staffLoadedOrder = true;
          update();
        }
      }
    });
  }

  Future<void> staffGetOrdersOfBabershop() async {
    staffLoadedBaberOrder = false;
    await orderRepo.staffGetBabershopOrder().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['order'].length > 0) {
          baberOrderByStaff.clear();
          for (int i = 0; i < resData['order'].length; i++) {
            if (resData['order'][i] != null) {
              Map<String, dynamic> map = resData['order'][i];
              baberAllOrderByStaff.add(Order.fromMap(map));
            }
          }
          staffLoadedBaberOrder = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<void> staffGetAllOrdersOfBabershop() async {
    staffLoadedAllBaberOrder = false;
    await orderRepo.staffGetAllBabershopOrder().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['order'].length > 0) {
          baberAllOrderByStaff.clear();
          for (int i = 0; i < resData['order'].length; i++) {
            if (resData['order'][i] != null) {
              Map<String, dynamic> map = resData['order'][i];
              baberAllOrderByStaff.add(Order.fromMap(map));
            }
          }
          staffLoadedAllBaberOrder = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<Map<String, dynamic>> createOrder(
    List<Cart> servicesItems,
    String paymentMethod,
    int serviceToTalPrice,
  ) async {
    var result;
    // String staffId =
    //     await UserPreference().getUser().then((value) => value.id!);
    // String babershopId =
    //     await UserPreference().getUser().then((value) => value.babershopId!);

    await orderRepo
        .createOrder(
      servicesItems,
      paymentMethod,
      serviceToTalPrice,
    )
        .then((value) {
      if (value.statusCode == 201) {
        final Map<String, dynamic> resData = json.decode(value.body);
        Order order = Order.fromMap(resData['createOrder']);
        isCreated = true;

        result = {
          'status': true,
          'message': 'Successfull',
          'order': order,
          'user_salary': resData['user_salary']
        };
        bookingController.clearBooking();
        update();
      } else {
        result = {
          'status': false,
          'code': value.statusCode,
          'message': value.body,
        };
        update();
      }
    });
    return result;
  }
}
