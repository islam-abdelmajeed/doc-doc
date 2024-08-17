import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                      "https://i0.wp.com/media.premiumtimesng.com/wp-content/files/2020/04/c9d56e28-nigerian-doctors-on-duty.jpg?fit=614%2C376&ssl=1",
                      height: 120.h,
                      width: 110.w,
                      fit: BoxFit.cover)),
              16.horizontalSpace,
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Doctor Name", style: TextStyles.font18DarkBlueBold, overflow: TextOverflow.ellipsis),
                  5.verticalSpace,
                  Text("Degree | 01066699130", style: TextStyles.font12GrayMedium, overflow: TextOverflow.ellipsis),
                  5.verticalSpace,
                  Text("Email@email.com", style: TextStyles.font12GrayMedium, overflow: TextOverflow.ellipsis),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
