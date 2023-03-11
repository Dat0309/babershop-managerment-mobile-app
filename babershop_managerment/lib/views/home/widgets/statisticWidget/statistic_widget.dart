import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/order_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticWidget extends StatefulWidget {
  const StatisticWidget({super.key});

  @override
  State<StatisticWidget> createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<StatisticWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Dimensions.heightPadding15,
          left: Dimensions.widthPadding25,
          right: Dimensions.widthPadding25),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: Dimensions.widthPadding25,
              bottom: Dimensions.heightPadding10,
              right: Dimensions.widthPadding25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BigText(text: 'Giám sát doanh thu'),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.widthPadding15,
          ),
          GetBuilder<OrderController>(builder: (orderController) {
            return orderController.staffLoadedOrder
                ? Column(
                    children: [
                      Center(
                        child: Container(
                            width: Dimensions.screenWidth,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                              color: AppColors.secondaryColor,
                            ),
                            child: LineChart(
                              LineChartData(
                                  borderData: FlBorderData(
                                      show: true,
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  gridData: FlGridData(
                                    show: true,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                          color: Colors.white, strokeWidth: 1);
                                    },
                                    drawVerticalLine: true,
                                    getDrawingVerticalLine: (value) {
                                      return FlLine(
                                          color: Colors.white, strokeWidth: 1);
                                    },
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 35,
                                        getTextStyles: (context, value) {
                                          return const TextStyle(
                                              color: Color(0xff68737d),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold);
                                        },
                                        margin: 8),
                                    rightTitles: SideTitles(),
                                    topTitles: SideTitles(),
                                    leftTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 35,
                                      getTextStyles: (context, value) {
                                        return const TextStyle(
                                            color: Color(0xff68737d),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold);
                                      },
                                      getTitles: (value) {
                                        switch (value.toInt()) {
                                          case 0:
                                            return '0';
                                          case 2:
                                            return '50';
                                          case 4:
                                            return '100';
                                          case 6:
                                            return '150';
                                        }
                                        return '';
                                      },
                                      margin: 12,
                                    ),
                                  ),
                                  maxX: 8,
                                  maxY: 8,
                                  minY: 0,
                                  minX: 0,
                                  lineBarsData: [
                                    LineChartBarData(
                                        spots: [
                                          const FlSpot(0, 0),
                                          const FlSpot(5, 5),
                                          const FlSpot(7, 6),
                                          const FlSpot(8, 4),
                                        ],
                                        isCurved: true,
                                        colors: [
                                          Colors.black12,
                                          Colors.white70,
                                          Colors.white
                                        ],
                                        barWidth: 5,
                                        belowBarData: BarAreaData(
                                            show: true,
                                            colors: [
                                              const Color(0xff23b6e6),
                                              const Color(0xff02d39a),
                                            ]
                                                .map((e) => e.withOpacity(0.3))
                                                .toList()))
                                  ]),
                            )),
                      ),
                    ],
                  )
                : SizedBox();
          })
        ],
      ),
    );
  }
}
