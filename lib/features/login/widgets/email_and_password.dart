import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:doc_doc/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/app_regex.dart';
import '../../../core/widgets/app_text_form_field.dart';
import 'password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordValidationsListeners();
  }

  void setupPasswordValidationsListeners() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(children: [
        AppTextFormField(
            controller: emailController,
            hintText: "Email",
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return "Please enter your email";
              }
            }),
        18.heightBox,
        AppTextFormField(
          controller: passwordController,
          hintText: "Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your password";
            }
          },
          isObscureText: isObscureText,
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() => isObscureText = !isObscureText);
              },
              child: Icon(isObscureText ? Icons.visibility : Icons.visibility_off)),
        ),
        24.heightBox,
        PasswordValidations(
          hasLowerCase: hasLowerCase,
          hasUpperCase: hasUpperCase,
          hasNumber: hasNumber,
          hasSpecialCharacter: hasSpecialCharacter,
          hasMinLength: hasMinLength,
        ),
      ]),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
