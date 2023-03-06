import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? username;
  String? password;
  String? avatar;
  String? role;
  int? salary;
  List<dynamic>? salaryHistory;
  String? baberShopId;
  int? workLate;
  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.username,
    this.password,
    this.avatar,
    this.role,
    this.salary,
    this.salaryHistory,
    this.baberShopId,
    this.workLate,
  });

  User copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? username,
    String? password,
    String? avatar,
    String? role,
    int? salary,
    List<dynamic>? salaryHistory,
    String? baberShopId,
    int? workLate,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      username: username ?? this.username,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      salary: salary ?? this.salary,
      salaryHistory: salaryHistory ?? this.salaryHistory,
      baberShopId: baberShopId ?? this.baberShopId,
      workLate: workLate ?? this.workLate,
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
      'salary': salary,
      'salary_history': salaryHistory,
      'babershop_id': baberShopId,
      'work_late': workLate,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] != null ? map['_id'] as String : null,
      fullName: map['full_name'] != null ? map['full_name'] as String : null,
      phoneNumber:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      salary: map['salary'] != null ? map['salary'] as int : null,
      salaryHistory: map['salary_history'] != null
          ? List<dynamic>.from((map['salary_history'] as List<dynamic>))
          : null,
      baberShopId:
          map['babershop_id'] != null ? map['babershop_id'] as String : null,
      workLate: map['work_late'] != null ? map['work_late'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, username: $username, password: $password, avatar: $avatar, role: $role, salary: $salary, salaryHistory: $salaryHistory, baberShopId: $baberShopId, workLate: $workLate)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.username == username &&
        other.password == password &&
        other.avatar == avatar &&
        other.role == role &&
        other.salary == salary &&
        listEquals(other.salaryHistory, salaryHistory) &&
        other.baberShopId == baberShopId &&
        other.workLate == workLate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        phoneNumber.hashCode ^
        username.hashCode ^
        password.hashCode ^
        avatar.hashCode ^
        role.hashCode ^
        salary.hashCode ^
        salaryHistory.hashCode ^
        baberShopId.hashCode ^
        workLate.hashCode;
  }
}
