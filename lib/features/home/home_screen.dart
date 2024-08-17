import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctors_blue_container.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/specialization_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20.sp, 16.sp, 20.sp, 28.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopBar(),
            const DoctorsBlueContainer(),
            16.heightBox,
            const DoctorsSpecialitySeeAll(),
            16.heightBox,
            const SpecializationAndDoctorsBlocBuilder(),
          ],
        ),
      )),
    );
  }
}
