import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/shared_widgets/movie_poster.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';

class WatchListItem extends StatelessWidget {
  final MovieDetails movie;
  const WatchListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MoviePoster(
            aspectRatio: 75 / 100,
            height: 150.h,
            movie: movie,
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title ?? "",
                maxLines: 1,
                style: AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                movie.releaseDate ?? "",
                style: AppStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.75)),
              ),
              SizedBox(
                height: 5.h,
              ),
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
                  Text(
                    double.parse(movie.voteAverage!).toStringAsFixed(1) ?? "0",
                    style: AppStyles.textStyle14,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
