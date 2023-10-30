import 'package:movies_app/models/movie_details_model/movie_details_model.dart';

class MoveiResponse {
  MoveiResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  MoveiResponse.fromJson(dynamic json) {
    page = json['page'];

    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieDetails.fromJson(v));
      });
    }

    totalPages = json['total_pages'];

    totalResults = json['total_results'];

    statusCode = json["status_code"];
    statusMessage = json["status_message"];

    success = json["success"];
  }
  int? page;
  List<MovieDetails>? results;
  int? totalPages;
  int? totalResults;
  int? statusCode;
  String? statusMessage;
  bool? success;
}
