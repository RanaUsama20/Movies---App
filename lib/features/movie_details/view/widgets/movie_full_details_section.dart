import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies_app/core/shared_widgets/custom_button.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movie_details/view/widgets/movie_details_bottom.dart';
import 'package:movies_app/features/movie_details/view/widgets/movie_details_top.dart';
import 'package:movies_app/features/movie_details/view_model/movie_detail_cubit/movie_detail_cubit.dart';

class MovieFullDetailsSection extends StatefulWidget {
  final int movieId;
  const MovieFullDetailsSection({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieFullDetailsSection> createState() =>
      _MovieFullDetailsSectionState();
}

class _MovieFullDetailsSectionState extends State<MovieFullDetailsSection> {
  MovieDetailCubit movieDetailsModel = MovieDetailCubit();

  @override
  void initState() {
    movieDetailsModel.getMovieDetails(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      bloc: movieDetailsModel,
      builder: (context, state) {
        if (state is MovieDetailSuccess) {
          return Column(
            children: [
              MovieDetailsTop(movieDetails: state.movieDetail),
              SizedBox(
                height: 20.h,
              ),
              MovieDetailsBottom(movieDetails: state.movieDetail),
            ],
          );
        } else if (state is MovieDetailFailure) {
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
                      movieDetailsModel.getMovieDetails(widget.movieId);
                      // setState(() {});
                    },
                  )
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 350.h,
            width: double.infinity,
            child: const Center(
              child: SpinKitFoldingCube(
                color: AppColors.yellowColor,
              ),
            ),
          );
        }
      },
    );
  }
}
