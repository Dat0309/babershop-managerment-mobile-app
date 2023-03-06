// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HairStyle {
  String? id;
  String? name;
  String? image;
  HairStyle({
    this.id,
    this.name,
    this.image,
  });

  HairStyle copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return HairStyle(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'image': image,
    };
  }

  factory HairStyle.fromMap(Map<String, dynamic> map) {
    return HairStyle(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HairStyle.fromJson(String source) =>
      HairStyle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HairStyle(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant HairStyle other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
