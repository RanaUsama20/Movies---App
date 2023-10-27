import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      height: 275.h,
      color: AppColors.darkColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "New Releases",
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          //دا الكود في حالة Success
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 10,
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 10.w),
          //         child: MoviePoster(
          //           height: 50.h,
          //           aspectRatio: 65 / 100,
          //         ),
          //       );
          //     },
          //   ),
          // ),

          // دا الكود في حالة الفايلد
          //  return Expanded(
          //         child: Text(
          //           state.errorMessage,
          //           style: AppStyles.textStyle20,
          //         ),
          //       );
          // ده برضه الزرار اللي هنعمل به فيتش للداتا لو في ايرور
          // getPopularMovies => بدلها هتحط الميثود اللي هتكونها
          // CustomButton(
          //   onPressed: () {
          //     popularMoviesViewModel.getPopularMovies();
          //   },
          // )
          // دا الكود في حالة اللودينج
          // return Expanded(
          //         child: SpinKitFoldingCube(
          //           size: 35.sp,
          //           color: AppColors.yellowColor,
          //         ),
          //       );
        ],
      ),
    );
  }
}
