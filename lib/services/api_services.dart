import 'dart:convert';
import 'dart:io';

import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/models/movie_details_model/movie_details_model.dart';
import 'package:movies_app/models/movie_model/movie_response_model.dart';
import "package:http/http.dart" as http;
import 'package:movies_app/models/recommended_movies_model/RecommendedMovieResponse.dart';

class ApiService {
  static Future<MovieResponse> getPopularMovies() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularEndPoint, {
        "api_key": ApiConstants.apiKey,
      });
      var response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      var responseData = MovieResponse.fromJson(jsonData);

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

  static Future<MovieResponse> getSimilarMovies(int movieId) async {
    try {
      Uri url = Uri.parse(
          "https://${ApiConstants.baseUrl}${ApiConstants.movieEndPoint}/${movieId}/similar?api_key=${ApiConstants.apiKey}");
      var response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      var responseData = MovieResponse.fromJson(jsonData);

      return responseData;
    } on Exception catch (e) {
      throw e;
    }
  }

  static Future<MovieResponse> getRecommendedMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.topRatedEndPoint, {
      "api_key": ApiConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      String bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MovieResponse> getMoviesBySearchQuery(
      String searchQuery, int page) async {
    try {
      Uri url = Uri.parse(
          "https://${ApiConstants.baseUrl}${ApiConstants.searchEndpoint}?query=$searchQuery&api_key=${ApiConstants.apiKey}&page=$page");
      var response = await http.get(url);
      print(url);
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      var responseData = MovieResponse.fromJson(jsonData);
      return responseData;
    } on SocketException catch (e) {
      rethrow;
    } on Exception catch (e) {
      throw e;
    }
  }
}
