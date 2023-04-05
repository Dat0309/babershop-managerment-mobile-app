import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:babershop_managerment/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingQuotesWidget extends StatefulWidget {
  const SettingQuotesWidget({super.key});

  @override
  State<SettingQuotesWidget> createState() => _SettingQuotesWidgetState();
}

class _SettingQuotesWidgetState extends State<SettingQuotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.widthPadding25,
        right: Dimensions.widthPadding25,
        bottom: Dimensions.heightPadding20,
        top: Dimensions.widthPadding20,
      ),
      child: GetBuilder<UserController>(builder: (user) {
        return user.isLoadedProfile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: 'Quản lý danh sách dịch vụ',
                    size: Dimensions.font32,
                  ),
                  SizedBox(
                    height: Dimensions.heightPadding10,
                  ),
                  SmallText(
                    text: 'Thêm-Xoá-Sửa các dịch vụ, chi phí,...',
                    size: Dimensions.font16,
                    color: AppColors.pargColor,
                  ),
                ],
              )
            : Container();
      }),
    );
  }
}
