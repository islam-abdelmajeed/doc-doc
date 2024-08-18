import 'package:doc_doc/core/helpers/extentions.dart';
import 'package:doc_doc/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_error_handler.dart';
import '../data/models/specialization_response_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationData?>? specializationsList = [];

  void getSpecialization() async {
    emit(const HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationResponseModel) {
        specializationsList = specializationResponseModel.specializationData;

        // getting the doctors list for the first specialization by default.
        getDoctorsList(specializationId: 1);
        emit(HomeState.specializationSuccess(specializationsList));
      },
      failure: (errorHandler) => emit(HomeState.specializationError(errorHandler)),
    );
  }

  void getDoctorsList({required int specializationId}) {
    List<Doctor?>? doctorsList = getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isEmptyOrNull()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle("No Data Found")));
    }
  }

  List<Doctor?>? getDoctorsListBySpecializationId(int specializationId) {
    return specializationsList?.firstWhere((specialization) => specialization?.id == specializationId)?.doctorsList;
  }
}
