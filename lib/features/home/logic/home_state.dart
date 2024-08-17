import 'package:doc_doc/core/networking/api_error_handler.dart';
import 'package:doc_doc/features/home/data/models/specialization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // specialization states

  const factory HomeState.specializationLoading() = SpecializationLoading;

  const factory HomeState.specializationSuccess(SpecializationResponseModel specializationResponseModel) = SpecializationSuccess;

  const factory HomeState.specializationError(ErrorHandler errorHandler) = SpecializationError;
}
