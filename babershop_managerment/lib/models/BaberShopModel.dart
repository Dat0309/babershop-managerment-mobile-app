// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BaberShop {
  String? id;
  String? name;
  BaberShop({
    this.id,
    this.name,
  });

  BaberShop copyWith({
    String? id,
    String? name,
  }) {
    return BaberShop(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
    };
  }

  factory BaberShop.fromMap(Map<String, dynamic> map) {
    return BaberShop(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BaberShop.fromJson(String source) =>
      BaberShop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BaberShop(id: $id, name: $name)';

  @override
  bool operator ==(covariant BaberShop other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
