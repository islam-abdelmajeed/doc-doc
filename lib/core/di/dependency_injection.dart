import 'package:dio/dio.dart';
import 'package:doc_doc/core/networking/api_service.dart';
import 'package:doc_doc/core/networking/dio_factory.dart';
import 'package:doc_doc/features/home/data/repo/home_repo.dart';
import 'package:doc_doc/features/login/data/repo/login_repo.dart';
import 'package:doc_doc/features/login/logic/cubit/login_cubit.dart';
import 'package:doc_doc/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/apis/home_api_service.dart';
import '../../features/sign_up/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio and ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  //sign up
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));

  //home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
