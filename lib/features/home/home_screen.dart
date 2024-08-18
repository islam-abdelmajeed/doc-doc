import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:doc_doc/features/home/widgets/doctors_list/doctors_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctors_blue_container.dart';
import 'widgets/speciality_see_all.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/speciality_list/specialization_bloc_builder.dart';

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DoctorsBlueContainer(),
                    16.heightBox,
                    const SpecialitySeeAll(),
                    16.heightBox,
                    const SpecializationBlocBuilder(),
                    8.heightBox,
                    const DoctorsBlocBuilder(),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
