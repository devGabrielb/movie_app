import 'package:movie_app/app/modules/search/models/popular_movies_model.dart';

class PopularMoviesListModel {
  int totalPages;
  List<PopularMoviesModel> popularMoviesModel;

  PopularMoviesListModel({this.popularMoviesModel, this.totalPages});

  PopularMoviesListModel.fromJson(Map<String, dynamic> json) {
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      popularMoviesModel = new List<PopularMoviesModel>();
      json['results'].forEach((v) {
        popularMoviesModel.add(new PopularMoviesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_pages'] = this.totalPages;
    if (this.popularMoviesModel != null) {
      data['results'] =
          this.popularMoviesModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
