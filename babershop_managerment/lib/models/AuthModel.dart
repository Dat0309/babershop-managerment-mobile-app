// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthModel {
  String? id;
  String? babershopId;
  String? fullName;
  String? role;
  int? salary;
  List<dynamic>? salaryHistory;
  String? token;
  String? createAt;
  AuthModel({
    this.id,
    this.babershopId,
    this.fullName,
    this.role,
    this.salary,
    this.salaryHistory,
    this.token,
    this.createAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'babershop_id': babershopId,
      'full_name': fullName,
      'role': role,
      'salary': salary,
      'salary_history': salaryHistory,
      'token': token,
      'createdAt': createAt,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      id: map['_id'] != null ? map['_id'] as String : null,
      babershopId:
          map['babershop_id'] != null ? map['babershop_id'] as String : null,
      fullName: map['full_name'] != null ? map['full_name'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      salary: map['salary'] != null ? map['salary'] as int : null,
      salaryHistory: map['salary_history'] != null
          ? List<dynamic>.from((map['salary_history'] as List<dynamic>))
          : null,
      token: map['token'] != null ? map['token'] as String : null,
      createAt: map['createdAt'] != null ? map['createdAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
