// ignore_for_file: non_constant_identifier_names, unnecessary_this

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Profile {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? username;
  String? password;
  String? avatar;
  String? role;
  String? baberShopId;
  int? salary;
  List<dynamic>? salary_history;
  String? createAt;
  Profile({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.username,
    this.password,
    this.avatar,
    this.role,
    this.baberShopId,
    this.salary,
    this.salary_history,
    this.createAt,
  });

  Profile copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? username,
    String? password,
    String? avatar,
    String? role,
    String? baberShopId,
    String? createAt,
  }) {
    return Profile(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      username: username ?? this.username,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      baberShopId: baberShopId ?? this.baberShopId,
      salary: salary ?? this.salary,
      salary_history: salary_history ?? this.salary_history,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'username': username,
      'password': password,
      'avatar': avatar,
      'role': role,
      'babershop_id': baberShopId,
      'salary': salary,
      'salary_history': salary_history,
      'createdAt': createAt,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['_id'] != null ? map['_id'] as String : null,
      fullName: map['full_name'] != null ? map['full_name'] as String : null,
      phoneNumber:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      baberShopId:
          map['babershop_id'] != null ? map['babershop_id'] as String : null,
      salary: map['salary'] != null ? map['salary'] as int : null,
      salary_history: map['salary_history'] != null
          ? List<dynamic>.from((map['salary_history'] as List<dynamic>))
          : null,
      createAt: map['createdAt'] != null ? map['createdAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(fullName: $fullName, phoneNumber: $phoneNumber, username: $username, password: $password, avatar: $avatar, role: $role, baberShopId: $baberShopId, createAt: $createAt)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.username == username &&
        other.password == password &&
        other.avatar == avatar &&
        other.role == role &&
        other.baberShopId == baberShopId &&
        other.createAt == createAt;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        phoneNumber.hashCode ^
        username.hashCode ^
        password.hashCode ^
        avatar.hashCode ^
        role.hashCode ^
        baberShopId.hashCode ^
        createAt.hashCode;
  }
}
