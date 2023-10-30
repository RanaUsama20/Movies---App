import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';

class MovieDetailsTop extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsTop({
    super.key,
    required this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            // imageUrl: artilce.urlToImage!,
            imageUrl: "${ApiConstants.imagePrefix}${movieDetails.backdropPath}",
            fit: BoxFit.fill,
            width: double.infinity,
            height: 200.h,
            errorWidget: (context, str, ob) {
              return Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.white.withOpacity(
                  //   0.3,
                  // ),
                  color: AppColors.yellowColor.withOpacity(
                    1,
                  ),
                ),
                child: Center(
                    child: Text(
                  "Sorry, no image found.",
                  style: AppStyles.textStyle20.copyWith(color: Colors.black),
                )),
              );
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            movieDetails.title ?? "No title found",
            style: AppStyles.textStyle18.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.yellowColor,
                size: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "${double.parse(movieDetails.voteAverage!).toStringAsFixed(1)}",
                style: AppStyles.textStyle16
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              Text(
                " (${movieDetails.voteCount})",
                style: AppStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColors.greyLightColor),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(movieDetails.releaseDate!,
                  style: AppStyles.textStyle12
                      .copyWith(color: AppColors.greyLightColor)),
              const SizedBox(
                width: 7,
              ),
              Text(minutesToHours(movieDetails.runtime!),
                  style: AppStyles.textStyle12
                      .copyWith(color: AppColors.greyLightColor)),
            ],
          ),
        ],
      ),
    );
  }

  String minutesToHours(int value) {
    if (value < 60) {
      return "${value}m";
    } else if (value == 60) {
      return "1hr";
    } else {
      var hour = value ~/ 60;
      var minutes = value % 60;
      return "${hour}hr ${minutes}m";
    }
  }
}
