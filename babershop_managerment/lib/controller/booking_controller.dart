import 'package:babershop_managerment/models/CartModel.dart';
import 'package:babershop_managerment/models/ServiceModel.dart';
import 'package:babershop_managerment/services/reposiitory/booking_repo.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final BookingRepo bookingRepo;

  BookingController({required this.bookingRepo});

  Map<String, Cart> items = {};
  List<Cart> storageItems = [];

  int get totalItems {
    var totalQuantity = 0;
    items.forEach((key, value) {
      totalQuantity += value.qty!;
    });
    //update();
    return totalQuantity;
  }

  int get totalPrice {
    var price = 0;
    items.forEach((key, value) {
      price += value.price! * value.qty!;
    });
    return price;
  }

  set setBooking(List<Cart> listItems) {
    storageItems = listItems;
    for (var item in storageItems) {
      items.putIfAbsent(item.serviceId!, () => item);
    }
  }

  void updateItemQty(String id, int qty) {
    if (items.containsKey(id)) {
      items.update(
          id,
          (value) => Cart(
                name: value.name,
                serviceId: value.serviceId,
                price: value.price,
                percent: value.percent,
                qty: qty,
              ));
    }
    update();
  }

  void removeItem(Services service) {
    items.remove(service.id);
    bookingRepo.addToBookingList(getItems);
    update();
  }

  void addItem(Services service, int qty) {
    if (items.containsKey(service.id)) {
      items.update(service.id!, (value) {
        return Cart(
          name: value.name,
          serviceId: value.serviceId,
          price: value.price,
          percent: service.percent,
          qty: value.qty! + qty,
        );
      });
    } else {
      items.putIfAbsent(
          service.id!,
          () => Cart(
                name: service.name,
                serviceId: service.id,
                price: service.price,
                percent: service.percent,
                qty: qty,
              ));
    }
    bookingRepo.addToBookingList(getItems);
    update();
  }

  bool existInBooking(Services service) {
    if (items.containsKey(service.id)) {
      return true;
    }
    return false;
  }

  List<Cart> get getItems {
    return items.entries.map((e) {
      return e.value;
    }).toList();
  }

  List<Cart> getBookingData() {
    return setBooking = bookingRepo.getBookingList();
  }

  void clearBooking() {
    bookingRepo.clearBookingStorage();
    items.clear();
    update();
  }
}
