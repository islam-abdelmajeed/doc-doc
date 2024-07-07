import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/core/theming/size_boxes.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.docdocLogo),
        10.widthBox,
        Text('DocDoc', style: TextStyles.font24Black700Weight),
      ],
    );
  }
}
