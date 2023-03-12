// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/models/OrderModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/util/dimensions.dart';

class ChartStatisticsBaberWidget extends StatefulWidget {
  final List<dynamic> orders;
  const ChartStatisticsBaberWidget({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  State<ChartStatisticsBaberWidget> createState() =>
      _ChartStatisticsBaberWidgetState();
}

class _ChartStatisticsBaberWidgetState
    extends State<ChartStatisticsBaberWidget> {
  late ChartSeriesController _chartSeriesController;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // TODO: implement initState
    _tooltipBehavior = TooltipBehavior(enable: true);
    Timer.periodic(const Duration(days: 1), updateDataSource);
    super.initState();
  }

  int getTotalPrice(String date, List<dynamic> orders) {
    int sum = 0;
    List<dynamic> filter = [];
    filter.addAll(orders);
    filter.retainWhere((element) {
      return element.createdAt.contains(date);
    });
    filter.forEach((element) {
      sum += element.serviceTotalPrice as int;
    });
    return sum;
  }

  void updateDataSource(Timer timer) {
    Get.find<OrderController>().staffGetAllOrdersOfBabershop();
    _chartSeriesController.updateDataSource(
        addedDataIndex: widget.orders.length - 1, removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            color: AppColors.secondaryColor,
          ),
          child: SfCartesianChart(
            title: ChartTitle(text: 'Thống kê doanh thu của tiệm'),
            tooltipBehavior: _tooltipBehavior,
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<dynamic, String>>[
              // Renders line chart
              LineSeries<dynamic, String>(
                onRendererCreated: ((controller) {
                  _chartSeriesController = controller;
                }),
                color: AppColors.primaryColor,
                dataSource: widget.orders,
                xValueMapper: (dynamic orders, _) =>
                    orders.createdAt.toString().split('T')[0],
                yValueMapper: (dynamic orders, _) =>
                    getTotalPrice(orders.createdAt, widget.orders),
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
