// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/models/CartModel.dart';
import 'package:babershop_managerment/models/ServiceModel.dart';
import 'package:get/get.dart';

import 'package:babershop_managerment/services/reposiitory/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({
    required this.cartRepo,
  });

  Map<String, Cart> items = {};
  List<Cart> storageItems = [];

  int get totalItems {
    var totalQuantity = 0;
    items.forEach((key, value) {
      totalQuantity += value.qty!;
    });
    update();
    return totalQuantity;
  }

  int get totalPrice {
    var price = 0;
    items.forEach((key, value) {
      price += value.price! * value.qty!;
    });
    return price;
  }

  set setCart(List<Cart> listItems) {
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
                qty: value.qty! + qty,
              ));
    }
    update();
  }

  void removeItem(Cart cart) {
    items.remove(cart.serviceId);
    cartRepo.addToCartList(getItems);
    update();
  }

  void addItem(Services services, int qty) {
    if (items.containsKey(services.id)) {
      items.update(services.id!, (value) {
        return Cart(
          name: value.name,
          serviceId: value.serviceId,
          price: value.price,
          qty: value.qty! + qty,
        );
      });
    } else {
      items.putIfAbsent(
          services.id!,
          () => Cart(
                name: services.name,
                serviceId: services.id,
                price: services.price,
                qty: qty,
              ));
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  bool existInCart(Services services) {
    if (items.containsKey(services.id)) {
      return true;
    }
    return false;
  }

  List<Cart> get getItems {
    return items.entries.map((e) {
      return e.value;
    }).toList();
  }

  List<Cart> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  void clearCart() {
    cartRepo.clearCartStorage();
    items.clear();
    update();
  }
}
