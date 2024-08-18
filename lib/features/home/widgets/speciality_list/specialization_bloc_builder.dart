import 'package:doc_doc/features/home/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:doc_doc/features/home/widgets/speciality_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'speciality_list_view.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is SpecializationLoading || current is SpecializationSuccess || current is SpecializationError,
        builder: (context, state) {
          return state.maybeWhen(
              specializationLoading: () => setupLoading(),
              specializationSuccess: (specializationsList) {
                return setupSuccess(specializationsList);
              },
              specializationError: (errorHandler) => setupError(),
              orElse: () {
                return const SizedBox.shrink();
              });
        });
  }

  Widget setupLoading() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpecialityShimmerLoading(),
        8.verticalSpace,
        const DoctorsShimmerLoading(),
      ],
    );
  }

  Widget setupSuccess(specializationData) {
    return SpecialityListView(
      specializationData: specializationData ?? [],
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
