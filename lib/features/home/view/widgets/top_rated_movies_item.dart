import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/shared_widgets/movie_poster.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';

class TopRatedMovieItem extends StatelessWidget {
  final MovieDetails movie;
  const TopRatedMovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: MoviePoster(
                aspectRatio: 65 / 100,
                movie: movie,
                height: 160.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              movie.title ?? "",
              style: AppStyles.textStyle14,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3.h),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.yellowColor,
                  size: 24.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text("${double.parse(movie.voteAverage!).toStringAsFixed(1)}"),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Text(
                    "(${movie.voteCount})",
                    style: AppStyles.textStyle12
                        .copyWith(color: Colors.white.withOpacity(0.6)),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(movie.releaseDate ?? "2023")
          ],
        ),
      ),
    );
  }
}
