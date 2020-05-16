import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/app/modules/search/search_module.dart';
import 'package:movie_app/configs.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0XFF1f1d32),
          body: TabBarView(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network('${Configs.baseUrlImage}/sJRcxUYDZb7LtV8AID19hxcqvaq.jpg'),
            ),
            RouterOutlet(module: SearchModule()),
            Container()
          ]),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.remove_red_eye,
              )),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.person_outline)),
            ],
            labelColor: Color(0XFFEF4D88),
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5),
            indicatorColor: Color(0XFFEF4D88),
          ),
        ));
  }
}
