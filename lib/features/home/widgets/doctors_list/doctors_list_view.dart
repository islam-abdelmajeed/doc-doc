import 'package:doc_doc/features/home/widgets/doctors_list/doctor_list_view_item.dart';
import 'package:flutter/material.dart';

import '../../data/models/specialization_response_model.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctor?>? doctorsList;
  const DoctorsListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctorsList?.length,
      itemBuilder: (context, index) => DoctorListViewItem(doctor: doctorsList![index]!),
    );
  }
}
