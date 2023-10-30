import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movie_details/view/widgets/movie_details_body.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';

class MovieDetailsView extends StatelessWidget {
  static String routeName = "moveDetailsScreen";
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var movieArgs = ModalRoute.of(context)!.settings.arguments as MovieDetails;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          movieArgs.title ?? "Unknown movie",
          style: AppStyles.textStyle20.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: MovieDetailsBody(movieId: movieArgs.id!),
    );
  }
}
