import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 195.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: 165.h,
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                image: const DecorationImage(image: AssetImage(AppImages.homeBluePattern), fit: BoxFit.cover),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Book and\nschedule with\nnearest doctor",
                    style: TextStyles.font18WhiteMedium,
                    textAlign: TextAlign.start,
                  ),
                  8.heightBox,
                  Expanded(
                    child: AppTextButton(
                      buttonText: "Find Nearby",
                      textStyle: TextStyles.font12BlueRegular,
                      onPressed: () {},
                      backgroundColor: Colors.white,
                      buttonWidth: 120.w,
                      borderRadius: 48.0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                right: 8.w,
                top: 0,
                child: Image.asset(
                  AppImages.onboardingDoctor,
                  height: 200.h,
                ))
          ],
        ));
  }
}
