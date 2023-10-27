import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie_details/view/widgets/movie_full_details_section.dart';
import 'package:movies_app/features/movie_details/view/widgets/similar_movies_section.dart';

class MovieDetailsBody extends StatelessWidget {
  final int movieId;
  const MovieDetailsBody({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieFullDetailsSection(movieId: movieId),
          SizedBox(
            height: 30.h,
          ),
          SimilarMoviesSection(movieId: movieId),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
