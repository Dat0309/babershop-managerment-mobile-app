// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_function_literals_in_foreach_calls
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';

class ChartStatisticsBaberWidget extends StatefulWidget {
  final String name;
  final dynamic statistics;
  const ChartStatisticsBaberWidget({
    Key? key,
    required this.name,
    required this.statistics,
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
    _tooltipBehavior = TooltipBehavior(enable: true);
    Timer.periodic(const Duration(days: 1), updateDataSource);
    super.initState();
  }

  int getTotalPrice(List<dynamic> orders) {
    int sum = 0;
    orders.forEach((element) {
      sum += element['service_total_price'] as int;
    });
    return sum;
  }

  void updateDataSource(Timer timer) {
    Get.find<OrderController>().staffGetAllOrdersOfBabershop();
    _chartSeriesController.updateDataSource(
        addedDataIndex: widget.statistics.orderChartData.length - 1,
        removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            color: AppColors.thirthColor,
          ),
          child: SfCartesianChart(
            title: ChartTitle(text: widget.name),
            tooltipBehavior: _tooltipBehavior,
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<dynamic, String>>[
              // Renders line chart
              LineSeries<dynamic, String>(
                onRendererCreated: ((controller) {
                  _chartSeriesController = controller;
                }),
                color: AppColors.primaryColor,
                dataSource: widget.statistics.orderChartData,
                xValueMapper: (dynamic orderChartData, _) =>
                    orderChartData['time'].toString().split(" ")[0],
                yValueMapper: (dynamic orderChartData, _) =>
                    getTotalPrice(orderChartData['orders']),
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
