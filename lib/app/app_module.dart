import 'package:movie_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/app/app_widget.dart';
import 'package:movie_app/app/modules/home/home_module.dart';
import 'package:movie_app/app/modules/login/login_module.dart';
import 'package:movie_app/app/modules/search/Widgets/movie_details/movie_details_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
         Router('/home', module: HomeModule()),
          Router('/movieDetails', child: (_, args) => MovieDetailsWidget(movie: args.data,))
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
