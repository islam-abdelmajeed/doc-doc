import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_images.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/specialization_response_model.dart';

class SpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final SpecializationData specializationItem;
  const SpecialityListViewItem({super.key, required this.itemIndex, required this.specializationItem, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          Container(
            decoration: itemIndex == selectedIndex
                ? BoxDecoration(
                    border: Border.all(color: ColorsManager.darkBlue),
                    shape: BoxShape.circle,
                  )
                : null,
            child: CircleAvatar(
              radius: 28.0,
              backgroundColor: ColorsManager.lightBlue,
              child: SvgPicture.asset(
                AppImages.doctorSVG,
                height: itemIndex == selectedIndex ? 42.h : 40.h,
                width: itemIndex == selectedIndex ? 42.w : 40.w,
              ),
            ),
          ),
          8.heightBox,
          Text(specializationItem.name ?? "Unknown",
              style: itemIndex == selectedIndex ? TextStyles.font14DarkBlueBold : TextStyles.font12DarkBlueRegular),
        ],
      ),
    );
  }
}
