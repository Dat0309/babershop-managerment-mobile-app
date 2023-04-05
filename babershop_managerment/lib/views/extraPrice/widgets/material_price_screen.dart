import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/extracost_controller.dart';
import 'package:babershop_managerment/enums/listMaterial.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/views/authentication/widget/button.dart';
import 'package:babershop_managerment/views/authentication/widget/text_field.dart';
import 'package:babershop_managerment/views/extraPrice/widgets/material_widget_card.dart';
import 'package:babershop_managerment/views/hairStyle/widgets/hair_style_header.dart';
import 'package:babershop_managerment/views/home/navigation.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaterialPriceScreen extends StatefulWidget {
  const MaterialPriceScreen({super.key});

  @override
  State<MaterialPriceScreen> createState() => _MaterialPriceScreenState();
}

class _MaterialPriceScreenState extends State<MaterialPriceScreen> {
  @override
  Widget build(BuildContext context) {
    var moneyController = TextEditingController();
    String material = "";

    void createExtracost(ExtracostController extracostController) {
      extracostController
          .createExtracost(
              'Mua nguyên vật liệu $material', int.parse(moneyController.text))
          .then((value) {
        if (value['status']) {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            body: Center(
              child: Column(
                children: [
                  const BigText(text: 'Thanh Toán Thành Công'),
                  BigText(text: value['extracost'].price.toString()),
                  SizedBox(
                    height: Dimensions.widthPadding30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => const NavigationPage());
                    },
                    child: const CustomButton(text: 'Về trang chủ'),
                  ),
                  SizedBox(
                    height: Dimensions.widthPadding30,
                  ),
                ],
              ),
            ),
          ).show();
        } else {
          Get.snackbar(
            'Không ổn rồi anh Lâm',
            'Đã có lỗi sảy ra trong quá trình thanh toán. Vui lòng kiểm tra lại thông tin!',
            backgroundColor: AppColors.primaryColor,
            colorText: AppColors.primaryBgColor,
          );
        }
      });
    }

    return GetBuilder<ExtracostController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              left: Dimensions.defaultPadding,
              right: Dimensions.defaultPadding,
              top: Dimensions.defaultPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HairStyleHeader(),
                SizedBox(
                  height: Dimensions.heightPadding20,
                ),
                Container(
                  width: Dimensions.screenWidth,
                  height: Dimensions.height120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: DecorationImage(
                      image: const AssetImage('assets/images/vatlieu.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.35),
                        BlendMode.multiply,
                      ),
                    ),
                  ),
                  child: Center(
                    child: BigText(
                      text: 'Ăn trưa',
                      color: AppColors.primaryBgColor,
                      size: Dimensions.font32,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.heightPadding20,
                ),
                const BigText(text: 'Danh sách nguyên vật liệu'),
                SizedBox(
                  height: Dimensions.heightPadding20,
                ),
                SizedBox(
                  height: Dimensions.height120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: materials.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                material = materials[index]['name'];
                              });
                            },
                            child: MaterialWidgetCard(
                                title: materials[index]['name'],
                                image: materials[index]['image']),
                          )),
                ),
                const BigText(
                  text: 'Số tiền',
                ),
                SizedBox(
                  height: Dimensions.heightPadding20,
                ),
                TextFieldCustom(
                    hint: 'Số tiền',
                    icon: Icons.attach_money_outlined,
                    controller: moneyController),
                SizedBox(
                  height: Dimensions.heightPadding45,
                ),
                GestureDetector(
                    onTap: () {
                      createExtracost(controller);
                    },
                    child: const CustomButton(text: 'Xác Nhận')),
              ],
            ),
          ),
        ),
      );
    });
  }
}
