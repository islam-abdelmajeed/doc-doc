import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/home_cubit.dart';
import '../logic/home_state.dart';
import 'doctors_list_view.dart';
import 'doctors_speciality_list_view.dart';

class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is SpecializationLoading || current is SpecializationSuccess || current is SpecializationError,
        builder: (context, state) {
          return state.maybeWhen(
              specializationLoading: () => setupLoading(),
              specializationSuccess: (specializationResponse) {
                var specializationData = specializationResponse.specializationData;
                return setupSuccess(specializationData);
              },
              specializationError: (errorHandler) => setupError(),
              orElse: () {
                return const SizedBox.shrink();
              });
        });
  }

  Widget setupLoading() {
    return SizedBox(
      height: 100.h,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget setupSuccess(specializationData) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationData: specializationData ?? [],
          ),
          DoctorsListView(
            doctorsList: specializationData?[0]?.doctorsList ?? [],
          ),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
