import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/app_images.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../data/models/specialization_response_model.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final SpecializationData specializationItem;
  const DoctorSpecialityListViewItem({super.key, required this.itemIndex, required this.specializationItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.0,
            backgroundColor: ColorsManager.lightBlue,
            child: SvgPicture.asset(AppImages.doctorSVG),
          ),
          8.heightBox,
          Text(specializationItem.name ?? "Unknown", style: TextStyles.font12DarkBlueRegular),
        ],
      ),
    );
  }
}
