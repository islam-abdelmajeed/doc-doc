import 'package:dio/dio.dart';
import 'package:doc_doc/features/home/data/apis/home_api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/specialization_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiURL.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.specialization)
  Future<SpecializationResponseModel> getSpecialization();
}
