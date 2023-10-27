import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/shared_widgets/movie_poster.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movie_details/view/widgets/movie_genres.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:readmore/readmore.dart';

class MovieDetailsBottom extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsBottom({
    super.key,
    required this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: movieDetails.genres!.map((genere) {
                    return MovieGenres(genreName: genere.name!);
                  }).toList(),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MoviePoster(
                      aspectRatio: 85 / 100,
                      height: 250.h,
                      movie: movieDetails,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: ReadMoreText(
                        movieDetails.overview!,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        trimLines: 10,
                        moreStyle: AppStyles.textStyle14.copyWith(
                          color: AppColors.yellowColor,
                          fontWeight: FontWeight.w500,
                        ),
                        lessStyle: AppStyles.textStyle14.copyWith(
                          color: AppColors.yellowColor,
                          fontWeight: FontWeight.w500,
                        ),
                        style: AppStyles.textStyle14
                            .copyWith(color: AppColors.greyLightColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
