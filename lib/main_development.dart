import 'package:doc_doc/core/di/dependency_injection.dart';
import 'package:doc_doc/core/helpers/extentions.dart';
import 'package:doc_doc/core/helpers/shared_pref_helper.dart';
import 'package:doc_doc/core/routing/app_router.dart';
import 'package:doc_doc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  userToken.isEmptyOrNull() ? isLoggedInUser = false : isLoggedInUser = true;
}
