import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/colors.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 28.0,
                    backgroundColor: ColorsManager.lightBlue,
                    child: SvgPicture.asset(AppImages.doctorSVG),
                  ),
                  8.heightBox,
                  Text("Speciality", style: TextStyles.font12DarkBlueRegular),
                ],
              ),
            );
          },
        ));
  }
}
