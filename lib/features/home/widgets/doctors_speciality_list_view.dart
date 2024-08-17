import 'package:doc_doc/features/home/widgets/doctor_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/models/specialization_response_model.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationData?> specializationData;
  const DoctorsSpecialityListView({super.key, required this.specializationData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: specializationData.length,
          itemBuilder: (BuildContext context, int index) =>
              DoctorSpecialityListViewItem(itemIndex: index, specializationItem: specializationData[index]!),
        ));
  }
}
