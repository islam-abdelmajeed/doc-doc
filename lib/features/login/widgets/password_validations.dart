import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasNumber,
      required this.hasSpecialCharacter,
      required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least one lowercase letter', hasLowerCase),
        2.heightBox,
        buildValidationRow('At least one uppercase letter', hasUpperCase),
        2.heightBox,
        buildValidationRow('At least one number', hasNumber),
        2.heightBox,
        buildValidationRow('At least one special character', hasSpecialCharacter),
        2.heightBox,
        buildValidationRow('At least 8 characters', hasMinLength),
      ],
    );
  }
}

buildValidationRow(String text, bool hasValidation) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: ColorsManager.gray,
      ),
      5.widthBox,
      Text(
        text,
        style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidation ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: hasValidation ? ColorsManager.gray : ColorsManager.darkBlue,
        ),
      ),
    ],
  );
}
