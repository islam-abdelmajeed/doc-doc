import 'package:doc_doc/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/sign_up_request_body.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(const SignUpState.signUpLoading());
    final response = await _signUpRepo.signUp(SignUpRequestBody(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
      gender: 0,
    ));

    response.when(
      success: (signUpResponse) => emit(SignUpState.signUpSuccess(signUpResponse)),
      failure: (error) => emit(SignUpState.signUpError(error: error.apiErrorModel.message ?? "Something went wrong")),
    );
  }
}
