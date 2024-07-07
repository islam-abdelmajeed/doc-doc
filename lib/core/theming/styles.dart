import 'package:doc_doc/core/theming/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, color: ColorsManager.black);

  static TextStyle font32BlueBold = TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: ColorsManager.mainBlue);

  static TextStyle font12GrayRegular = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal, color: ColorsManager.gray);
  static TextStyle font16WhiteSemiBold = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: ColorsManager.white);
}
