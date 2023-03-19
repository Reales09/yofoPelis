// To parse this JSON data, do
//
//     final topRatedResponse = topRatedResponseFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

class TopRatedResponse {
  TopRatedResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory TopRatedResponse.fromRawJson(String str) =>
      TopRatedResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopRatedResponse.fromJson(Map<String, dynamic> json) =>
      TopRatedResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toString())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
