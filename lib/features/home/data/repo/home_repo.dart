import 'package:doc_doc/core/networking/api_error_handler.dart';
import 'package:doc_doc/features/home/data/apis/home_api_service.dart';
import 'package:doc_doc/features/home/data/models/specialization_response_model.dart';

import '../../../../core/networking/api_result.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
