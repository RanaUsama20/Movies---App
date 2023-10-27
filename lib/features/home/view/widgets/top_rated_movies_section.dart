import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      height: 350.h,
      color: AppColors.darkColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Top rated",
              style: AppStyles.textStyle18.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),

          // دا في حالة الساكسيس
          //  return Expanded(
          //         child: ListView.builder(
          //           itemCount: dummyMovieData.length,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (context, index) {
          //             return TopRatedMovieItem(
          //               movie: state.movies[index],
          //             );
          //           },
          //         ),
          //       );
          //دا الكود في حالة ايرور
          //  return SizedBox(
          //         child: Center(
          //           child: Text(
          //             state.errorMessage,
          //             style: AppStyles.textStyle20,
          //           ),
          //         ),
          //       );

          // ده برضه الزرار اللي هنعمل به فيتش للداتا لو في ايرور
          // getPopularMovies => بدلها هتحط الميثود اللي هتكونها
          // CustomButton(
          //   onPressed: () {
          //     popularMoviesViewModel.getPopularMovies();
          //   },
          // )
          // دا الكود في حالة اللوديمج
          //  return Expanded(
          //         child: SpinKitFoldingCube(
          //           color: AppColors.yellowColor,
          //           size: 35.sp,
          //         ),
          //       );
        ],
      ),
    );
  }
}
