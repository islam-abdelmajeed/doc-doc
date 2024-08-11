import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/features/onboarding/widgets/doc_image_and_text.dart';
import 'package:doc_doc/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:doc_doc/features/onboarding/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
        child: Column(
          children: [
            const DocLogoAndName(),
            30.heightBox,
            const DoctorImageAndText(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  Text(
                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                    textAlign: TextAlign.center,
                    style: TextStyles.font12GrayRegular,
                  ),
                  30.heightBox,
                  const GetStartedButton(),
                ],
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
