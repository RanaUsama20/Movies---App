import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/core/shared_widgets/movie_poster.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';

class PopularMovieCarouselItem extends StatelessWidget {
  final MovieDetails movie;
  const PopularMovieCarouselItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CachedNetworkImage(
            // imageUrl: artilce.urlToImage!,
            imageUrl: "${ApiConstants.imagePrefix}${movie.backdropPath}",
            fit: BoxFit.fill,
            width: double.infinity,
            height: 200.h,
            errorWidget: (context, str, ob) {
              return Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.yellowColor.withOpacity(
                    1,
                  ),
                ),
                child: Center(
                    child: Text(
                  "Sorry, no image found.",
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle20.copyWith(color: Colors.black),
                )),
              );
            },
          ),
          Positioned(
            // bottom: MediaQuery.of(context).size.height * 0.13 * -1,
            bottom: -20.h,
            right: 0,
            left: 20.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MoviePoster(
                  aspectRatio: 65 / 100,
                  movie: movie,
                  height: 200.h,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? "",
                        style: AppStyles.textStyle16,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                            double.parse(movie.voteAverage ?? "0")
                                .toStringAsFixed(1),
                            style: AppStyles.textStyle14,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "(${movie.voteCount ?? "0"})",
                            style: AppStyles.textStyle14
                                .copyWith(color: Colors.white.withOpacity(0.6)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
