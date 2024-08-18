import 'package:doc_doc/features/home/widgets/speciality_list/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/specialization_response_model.dart';
import '../../logic/home_cubit.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationData?> specializationData;
  const SpecialityListView({super.key, required this.specializationData});

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  int selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.specializationData.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() => selectedSpecializationIndex = index);
              context.read<HomeCubit>().getDoctorsList(specializationId: widget.specializationData[index]!.id!);
            },
            child: SpecialityListViewItem(
              itemIndex: index,
              specializationItem: widget.specializationData[index]!,
              selectedIndex: selectedSpecializationIndex,
            ),
          ),
        ));
  }
}
