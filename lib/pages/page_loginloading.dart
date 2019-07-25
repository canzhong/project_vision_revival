import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
//import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:project_vision_revival/api/dbapi.dart';
import 'package:project_vision_revival/models/model_user.dart';
import 'package:project_vision_revival/pages/page_home.dart';
import 'package:project_vision_revival/bloc/bloc_loginstatus.dart';

import 'package:project_vision_revival/models/model_device.dart';


class LoadingHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    loadingSuccessful() {
      return RaisedButton(
        child: Text('Loading Good'),
        color: Colors.red,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("/welcome");
        },
      );
    }




    return Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: new Image.asset(
                'assets/images/tangerinebackground.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    Text('Welcome',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)
                    ),
                    SizedBox(height: 30.0),
                    Text('user}',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.asset('assets/images/biggy.png',
                          color: Colors.redAccent),
                    ),
                    loadingSuccessful(),
                  ],
                )
            )
          ],
        ));
  }
}
