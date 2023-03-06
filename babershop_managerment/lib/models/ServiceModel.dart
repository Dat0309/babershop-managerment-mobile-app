// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Services {
  String? id;
  String? name;
  int? price;
  double? percent;
  Services({
    this.id,
    this.name,
    this.price,
    this.percent,
  });

  Services copyWith({
    String? id,
    String? name,
    int? price,
    double? percent,
  }) {
    return Services(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      percent: percent ?? this.percent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'price': price,
      'percent': percent,
    };
  }

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      percent: map['percent'] != null ? map['percent'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Services.fromJson(String source) =>
      Services.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Services(id: $id, name: $name, price: $price, percent: $percent)';
  }

  @override
  bool operator ==(covariant Services other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.percent == percent;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ percent.hashCode;
  }
}
