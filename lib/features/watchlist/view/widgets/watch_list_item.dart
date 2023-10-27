import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // MoviePoster(
          //   aspectRatio: 75 / 100,
          //   height: 150.h,
          // ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dora and the",
                style: AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "2019",
                style: AppStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.75)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Authors",
                style: AppStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.75)),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
