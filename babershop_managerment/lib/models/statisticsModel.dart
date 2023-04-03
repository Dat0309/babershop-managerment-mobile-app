// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class StatistiscModel {
  int? revenue;
  int? extraCost;
  int? staffSalary;
  int? surplus;
  List<dynamic>? orderChartData;
  StatistiscModel({
    this.revenue,
    this.extraCost,
    this.staffSalary,
    this.surplus,
    this.orderChartData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'revenue': revenue,
      'extra_cost': extraCost,
      'staff_salary': staffSalary,
      'surplus': surplus,
      'order_chart': orderChartData,
    };
  }

  factory StatistiscModel.fromMap(Map<String, dynamic> map) {
    return StatistiscModel(
      revenue: map['revenue'] != null ? map['revenue'] as int : null,
      extraCost: map['extra_cost'] != null ? map['extra_cost'] as int : null,
      staffSalary:
          map['staff_salary'] != null ? map['staff_salary'] as int : null,
      surplus: map['surplus'] != null ? map['surplus'] as int : null,
      orderChartData: map['order_chart'] != null
          ? List<dynamic>.from((map['order_chart'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatistiscModel.fromJson(String source) =>
      StatistiscModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StatistiscModel(revenue: $revenue, extraCost: $extraCost, staffSalary: $staffSalary, surplus: $surplus, orderChartData: $orderChartData)';
  }

  @override
  bool operator ==(covariant StatistiscModel other) {
    if (identical(this, other)) return true;

    return other.revenue == revenue &&
        other.extraCost == extraCost &&
        other.staffSalary == staffSalary &&
        other.surplus == surplus &&
        listEquals(other.orderChartData, orderChartData);
  }

  @override
  int get hashCode {
    return revenue.hashCode ^
        extraCost.hashCode ^
        staffSalary.hashCode ^
        surplus.hashCode ^
        orderChartData.hashCode;
  }
}
