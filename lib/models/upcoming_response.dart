// To parse this JSON data, do
//
//     final upcomingResponse = upcomingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:yofopelis/models/models.dart';

class UpcomingResponse {
  UpcomingResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory UpcomingResponse.fromRawJson(String str) =>
      UpcomingResponse.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory UpcomingResponse.fromJson(Map<String, dynamic> json) =>
      UpcomingResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  // Map<String, dynamic> toJson() => {
  //       "dates": dates.toJson(),
  //       "page": page,
  //       "results": List<dynamic>.from(results.map((x) => x.toJson())),
  //       "total_pages": totalPages,
  //       "total_results": totalResults,
  //     };
}
