// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Extracost {
  String? babershopId;
  String? staffId;
  String? title;
  int? price;
  Extracost({
    this.babershopId,
    this.staffId,
    this.title,
    this.price,
  });

  Extracost copyWith({
    String? babershopId,
    String? staffId,
    String? title,
    int? price,
  }) {
    return Extracost(
      babershopId: babershopId ?? this.babershopId,
      staffId: staffId ?? this.staffId,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'babershop': babershopId,
      'staff': staffId,
      'title': title,
      'price': price,
    };
  }

  factory Extracost.fromMap(Map<String, dynamic> map) {
    return Extracost(
      babershopId: map['babershop'] != null ? map['babershop'] as String : null,
      staffId: map['staff'] != null ? map['staff'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Extracost.fromJson(String source) =>
      Extracost.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Extracost(babershopId: $babershopId, staffId: $staffId, title: $title, price: $price)';
  }

  @override
  bool operator ==(covariant Extracost other) {
    if (identical(this, other)) return true;

    return other.babershopId == babershopId &&
        other.staffId == staffId &&
        other.title == title &&
        other.price == price;
  }

  @override
  int get hashCode {
    return babershopId.hashCode ^
        staffId.hashCode ^
        title.hashCode ^
        price.hashCode;
  }
}
