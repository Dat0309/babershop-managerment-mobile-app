import 'package:babershop_managerment/constant/colors.dart';
import 'package:babershop_managerment/controller/user_controller.dart';
import 'package:babershop_managerment/util/dimensions.dart';
import 'package:babershop_managerment/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppQuote extends StatefulWidget {
  const AppQuote({super.key});

  @override
  State<AppQuote> createState() => _AppQuoteState();
}

class _AppQuoteState extends State<AppQuote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.widthPadding25,
        right: Dimensions.widthPadding25,
        bottom: Dimensions.heightPadding20,
      ),
      child: GetBuilder<UserController>(builder: (user) {
        return user.isLoadedProfile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Chào ${user.profile!.fullName!},'),
                  SizedBox(
                    height: Dimensions.heightPadding10,
                  ),
                  GestureDetector(
                    onTap: () {
                      user.clearSalary();
                    },
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.widthPadding15),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.primaryColor),
                      child: BigText(
                        text: 'Bắt đầu làm việc',
                        color: AppColors.thirthColor,
                        size: Dimensions.font16,
                      ),
                    ),
                  ),
                ],
              )
            : Container();
      }),
    );
  }
}
