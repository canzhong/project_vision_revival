//General Imports
import 'package:flutter/cupertino.dart';
import 'package:project_vision_revival/main.dart';

//import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:project_vision_revival/models/model_notification.dart'
as prefix0;
import 'package:project_vision_revival/pages/page_initialopen.dart';
import 'package:project_vision_revival/providers/provider_generic.dart';
import 'package:provider/provider.dart';

//Bloc imports
import 'package:project_vision_revival/bloc/bloc_login.dart';

//model imports
import 'package:project_vision_revival/models/model_user.dart';
import 'package:project_vision_revival/models/model_device.dart';
import 'package:project_vision_revival/models/model_notification.dart';
import 'package:project_vision_revival/api/dbapi.dart';

//Page Imports
import 'package:project_vision_revival/api/auth_simulator.dart';

class LogOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: Text('Logout'),
      color: Colors.red,
      onPressed: () {
        appAuth.logout().then(
                (_) => Navigator.of(context).pushReplacementNamed('/login'));
      },
    );
  }

}