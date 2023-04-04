// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Order {
  String? babershopId;
  String? staffId;
  List<dynamic>? servicesItems;
  String? paymentMethod;
  int? serviceTotalPrice;
  String? createdAt;
  Order({
    this.babershopId,
    this.staffId,
    this.servicesItems,
    this.paymentMethod,
    this.serviceTotalPrice,
    this.createdAt,
  });

  Order copyWith({
    String? babershopId,
    String? staffId,
    List<dynamic>? servicesItems,
    String? paymentMethod,
    int? serviceTotalPrice,
    String? createdAt,
  }) {
    return Order(
      babershopId: babershopId ?? this.babershopId,
      staffId: staffId ?? this.staffId,
      servicesItems: servicesItems ?? this.servicesItems,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      serviceTotalPrice: serviceTotalPrice ?? this.serviceTotalPrice,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'babershop': babershopId,
      'staff': staffId,
      'servicesItems': servicesItems,
      'paymentMethod': paymentMethod,
      'serviceTotalPrice': serviceTotalPrice,
      'createdAt': createdAt,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      babershopId: map['babershop'] != null ? map['babershop'] as String : null,
      staffId: map['staff'] != null ? map['staff'] as String : null,
      servicesItems: map['services_items'] != null
          ? List<dynamic>.from((map['services_items'] as List<dynamic>))
          : null,
      paymentMethod: map['payment_method'] != null
          ? map['payment_method'] as String
          : null,
      serviceTotalPrice: map['service_total_price'] != null
          ? map['service_total_price'] as int
          : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(babershopId: $babershopId, staffId: $staffId, servicesItems: $servicesItems, paymentMethod: $paymentMethod, serviceTotalPrice: $serviceTotalPrice)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.babershopId == babershopId &&
        other.staffId == staffId &&
        listEquals(other.servicesItems, servicesItems) &&
        other.paymentMethod == paymentMethod &&
        other.serviceTotalPrice == serviceTotalPrice;
  }

  @override
  int get hashCode {
    return babershopId.hashCode ^
        staffId.hashCode ^
        servicesItems.hashCode ^
        paymentMethod.hashCode ^
        serviceTotalPrice.hashCode;
  }
}
