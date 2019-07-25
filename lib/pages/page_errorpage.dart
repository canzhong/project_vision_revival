import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
//import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:project_vision_revival/api/dbapi.dart';
import 'package:project_vision_revival/models/model_user.dart';
import 'package:project_vision_revival/pages/page_home.dart';
import 'package:project_vision_revival/bloc/bloc_loginstatus.dart';

import 'package:project_vision_revival/models/model_device.dart';


class ErrorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: new Image.asset(
                'assets/images/tangerinebackground.png',
                width: Provider.of<Device>(context).width,
                height: Provider.of<Device>(context).height,
                fit: BoxFit.fill,
              ),
            ),
    ]
           ));
  }
}
