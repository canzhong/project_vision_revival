import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_vision_revival/bloc/bloc_loginstatus.dart';
import 'package:project_vision_revival/providers/provider_generic.dart';
//import 'package:project_vision_revival/pages/page_home.dart';
import 'package:project_vision_revival/bloc/bloc_login.dart';
import 'package:project_vision_revival/pages/page_loginloading.dart';
import 'package:project_vision_revival/pages/page_initialopen.dart';
import 'package:provider/provider.dart';
import 'package:project_vision_revival/models/model_device.dart';
import 'package:project_vision_revival/pages/page_home.dart';
import 'package:project_vision_revival/pages/page_errorpage.dart';
import 'package:project_vision_revival/api/auth_simulator.dart';
import 'package:project_vision_revival/pages/page_testimony.dart';
import 'package:project_vision_revival/pages/vineyardhome.dart';

AuthService appAuth = new AuthService();

void main() async {
  //default homepage
  Widget _defaultHome = new BlocProvider(
      bloc: new LoginBloc(), child: new InitialOpen());

  //attempt to login
  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = new LoadingHome();
  }


  runApp(new MaterialApp(
    title: 'VisViVal',
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new LoadingHome(),
      '/welcome': (BuildContext context) => new Home(),
      '/login': (BuildContext context) =>
      new BlocProvider(bloc: new LoginBloc(), child: new InitialOpen()),
      '/testimony': (BuildContext context) => new Testimony(),
      '/vineyard': (BuildContext context) => new Vineyard(),
    },
  ));
}
