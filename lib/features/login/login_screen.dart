import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/app_text_button.dart';
import 'package:doc_doc/features/login/data/models/login_request_body.dart';
import 'package:doc_doc/features/login/widgets/dont_have_account_text.dart';
import 'package:doc_doc/features/login/widgets/email_and_password.dart';
import 'package:doc_doc/features/login/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'logic/cubit/login_cubit.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  GlobalKey formKey = GlobalKey<FormState>();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back!", style: TextStyles.font24BlueBold),
                8.heightBox,
                Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                    style: TextStyles.font14GrayRegular),
                36.heightBox,
                Column(
                  children: [
                    const EmailAndPassword(),
                    24.heightBox,
                    Align(alignment: Alignment.centerRight, child: Text("Forgot Password?", style: TextStyles.font13BlueRegular)),
                    40.heightBox,
                    AppTextButton(
                        buttonText: "Login",
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          validateThenDoLogin(context);
                        }),
                    16.heightBox,
                    const TermsAndConditionsText(),
                    60.heightBox,
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
