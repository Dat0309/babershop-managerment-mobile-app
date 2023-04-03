// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/authentication/widget/button.dart';
import 'package:babershop_managerment/views/authentication/widget/text_field.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/hair_style_header.dart';
import 'package:babershop_managerment/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';

import 'package:babershop_managerment/models/ServiceModel.dart';
import 'package:flutter/material.dart';

class DetailServiceScreen extends StatefulWidget {
  final Services? services;
  const DetailServiceScreen({
    Key? key,
    this.services,
  }) : super(key: key);

  @override
  State<DetailServiceScreen> createState() => _DetailServiceScreenState();
}

class _DetailServiceScreenState extends State<DetailServiceScreen> {
  @override
  Widget build(BuildContext context) {
    var serviceNameController = TextEditingController(
        text: widget.services != null ? widget.services?.name : "Tên dịch vụ");
    var priceController = TextEditingController(
        text: widget.services != null
            ? widget.services?.price.toString()
            : "Giá cả dịch vụ");
    var percentController = TextEditingController(
        text: widget.services != null
            ? widget.services?.percent.toString()
            : "Phần trăm thợ");
    return widget.services != null
        ? SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HairStyleHeader(),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.defaultPadding),
                    child: Column(
                      children: [
                        TextFieldCustom(
                            hint: serviceNameController.text,
                            icon: Icons.design_services,
                            controller: serviceNameController),
                        SizedBox(
                          height: Dimensions.heightPadding20,
                        ),
                        TextFieldCustom(
                            hint: "${priceController.text}vnđ",
                            icon: Icons.price_change,
                            controller: priceController),
                        SizedBox(
                          height: Dimensions.heightPadding20,
                        ),
                        TextFieldCustom(
                            hint: percentController.text,
                            icon: Icons.percent,
                            controller: percentController),
                        SizedBox(
                          height: Dimensions.heightPadding45,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CustomButton(text: 'Thêm dịch vụ'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HairStyleHeader(),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.defaultPadding),
                    child: Column(
                      children: [
                        TextFieldCustom(
                            hint: serviceNameController.text,
                            icon: Icons.design_services,
                            controller: serviceNameController),
                        SizedBox(
                          height: Dimensions.heightPadding20,
                        ),
                        TextFieldCustom(
                            hint: "${priceController.text}vnđ",
                            icon: Icons.price_change,
                            controller: priceController),
                        SizedBox(
                          height: Dimensions.heightPadding20,
                        ),
                        TextFieldCustom(
                            hint: percentController.text,
                            icon: Icons.percent,
                            controller: percentController),
                        SizedBox(
                          height: Dimensions.heightPadding45,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CustomButton(text: 'Thêm dịch vụ'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
