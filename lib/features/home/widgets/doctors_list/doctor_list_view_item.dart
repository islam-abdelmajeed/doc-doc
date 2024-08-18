import 'package:doc_doc/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorListViewItem extends StatelessWidget {
  final Doctor doctor;
  const DoctorListViewItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: "https://i0.wp.com/media.premiumtimesng.com/wp-content/files/2020/04/c9d56e28-nigerian-doctors-on-duty.jpg?fit=614%2C376&ssl=1",
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: ColorsManager.lightGray,
                highlightColor: Colors.white,
                child: Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              width: 110.w,
              height: 120.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(doctor.name ?? "Name", style: TextStyles.font18DarkBlueBold, overflow: TextOverflow.ellipsis),
              5.verticalSpace,
              Text("${doctor.degree} | ${doctor.phone}", style: TextStyles.font12GrayMedium, overflow: TextOverflow.ellipsis),
              5.verticalSpace,
              Text(doctor.email ?? "Email", style: TextStyles.font12GrayMedium, overflow: TextOverflow.ellipsis),
            ]),
          ),
        ],
      ),
    );
  }
}
