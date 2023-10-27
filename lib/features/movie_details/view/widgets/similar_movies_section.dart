import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app/core/shared_widgets/custom_button.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/home/view/widgets/top_rated_movies_item.dart';
import 'package:movies_app/features/movie_details/view/movie_details_view.dart';
import 'package:movies_app/features/movie_details/view_model/similar_movies_cubit/similar_movies_cubit.dart';

class SimilarMoviesSection extends StatefulWidget {
  final int movieId;
  const SimilarMoviesSection({super.key, required this.movieId});

  @override
  State<SimilarMoviesSection> createState() => _SimilarMoviesSectionState();
}

class _SimilarMoviesSectionState extends State<SimilarMoviesSection> {
  SimilarMoviesCubit similarMoviesCubit = SimilarMoviesCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    similarMoviesCubit.getSimilarMovies(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
      bloc: similarMoviesCubit,
      builder: (context, state) {
        if (state is SimilarMoviesFailure) {
          return SizedBox(
            width: double.infinity,
            height: 350.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    style: AppStyles.textStyle20,
                  ),
                  CustomButton(
                    onPressed: () {
                      similarMoviesCubit.getSimilarMovies(widget.movieId);
                      // setState(() {});
                    },
                  )
                ],
              ),
            ),
          );
        }
        if (state is SimilarMoviesSucces) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            width: double.infinity,
            color: AppColors.darkColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "More Like this",
                    style: AppStyles.textStyle18.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 290.h,
                  child: ListView.builder(
                    itemCount: state.movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.pushNamed(
                              context, MovieDetailsView.routeName,
                              arguments: state.movies[index]);
                        },
                        child: TopRatedMovieItem(
                          movie: state.movies[index],
                        ),
                      );
                    },
                  ),
                )
                //       );
              ],
            ),
          );
        }
        return SpinKitFoldingCube(
          color: AppColors.yellowColor,
          size: 35.sp,
        );
      },
    );
  }
}
