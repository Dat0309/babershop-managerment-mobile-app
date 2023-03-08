// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cart {
  String? name;
  int? qty;
  String? image;
  int? price;
  String? serviceId;
  Cart({
    this.name,
    this.qty,
    this.price,
    this.serviceId,
  });

  Cart copyWith({
    String? name,
    int? qty,
    int? price,
    String? serviceId,
  }) {
    return Cart(
      name: name ?? this.name,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      serviceId: serviceId ?? this.serviceId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'qty': qty,
      'price': price,
      'services': serviceId,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      name: map['name'] != null ? map['name'] as String : null,
      qty: map['qty'] != null ? map['qty'] as int : null,
      price: map['price'] != null ? map['price'] as int : null,
      serviceId: map['services'] != null ? map['services'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(name: $name, qty: $qty, price: $price, serviceId: $serviceId)';
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.qty == qty &&
        other.price == price &&
        other.serviceId == serviceId;
  }

  @override
  int get hashCode {
    return name.hashCode ^ qty.hashCode ^ price.hashCode ^ serviceId.hashCode;
  }
}
