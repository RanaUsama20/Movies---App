import 'dart:convert';
import 'dart:io';

import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/models/movie_model/movie_response_model.dart';
import "package:http/http.dart" as http;

class ApiService {
  static Future<MoveiResponse> getPopularMovies() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularEndPoint, {
        "api_key": ApiConstants.apiKey,
      });
      var response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      var responseData = MoveiResponse.fromJson(jsonData);

      return responseData;
    } on SocketException catch (e) {
      throw "No internet connection.";
    } catch (e) {
      throw "There was an error, try again later";
    }
  }

  static Future<MovieDetails> getMovieDetails(int movieId) async {
    try {
      Uri url = Uri.parse(
          "https://${ApiConstants.baseUrl}${ApiConstants.movieEndPoint}/${movieId}?api_key=${ApiConstants.apiKey}");
      var response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      var responseData = MovieDetails.fromJson(jsonData);
      return responseData;
    } on Exception catch (e) {
      throw e;
    }
  }

  static Future<MoveiResponse> getSimilarMovies(int movieId) async {
    try {
      Uri url = Uri.parse(
          "https://${ApiConstants.baseUrl}${ApiConstants.movieEndPoint}/${movieId}/similar?api_key=${ApiConstants.apiKey}");
      var response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      var responseData = MoveiResponse.fromJson(jsonData);

      return responseData;
    } on Exception catch (e) {
      throw e;
    }
  }
}
