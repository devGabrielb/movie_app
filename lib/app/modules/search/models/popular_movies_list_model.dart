
import 'movie_model.dart';

class PopularMoviesListModel {
  int totalPages;
  List<MovieModel> popularMoviesModel;

  PopularMoviesListModel({this.popularMoviesModel, this.totalPages});

  PopularMoviesListModel.fromJson(Map<String, dynamic> json) {
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      popularMoviesModel = new List<MovieModel>();
      json['results'].forEach((v) {
        popularMoviesModel.add(new MovieModel.fromJson(v));
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
