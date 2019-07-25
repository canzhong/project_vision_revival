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
import 'package:project_vision_revival/pages/vineyardhome.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    workingsStack() {
      List<prefix0.Notification> listnotifications = api.getNotifcations();
      List<bool> visited = new List(listnotifications.length);
      for (int i = 0 ; i < visited.length; i++) {
         visited[i] = false;
      }

      return new SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: listnotifications
              .map((not) => new Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(not.user),
                      new Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0),
                          child: new Container(
                              width: (deviceWidth / 3) - 50,
                              height: (deviceWidth / 3) - 50,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: new FlatButton(
                                onPressed: () {
                                  visited[listnotifications.indexOf(not)] = true;
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                },
                                child:
                                    new Image.asset('assets/images/biggy.png'),
                              ))),
                    ],
                  )))
              .toList(),
        ),
      );
    }

    logOut() {
      return new RaisedButton(
        child: Text('Logout'),
        color: Colors.red,
        onPressed: () {
          appAuth.logout().then(
              (_) => Navigator.of(context).pushReplacementNamed('/login'));
        },
      );
    }

    testimonyButton() {
      return new Container(
          width: deviceWidth / 2,
          height: deviceWidth / 2,
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: new FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/testimony');
            },
            child: new Image.asset('assets/images/biggy.png'),
          ));
    }

    uploadRequestButton() {
      return new Container(
          width: deviceWidth / 3 - 20,
          height: deviceWidth / 3 - 20,
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: new FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: new Image.asset('assets/images/biggy.png'),
          ));
    }

    uploadPraiseButton() {
      return new Container(
          width: deviceWidth / 3 - 20,
          height: deviceWidth / 3 - 20,
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: new FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: new Image.asset('assets/images/biggy.png'),
          ));
    }

    viewVineyardButton() {
      return new Container(
          width: deviceWidth / 3 - 20,
          height: deviceWidth / 3 - 20,
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: new FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/vineyard');
            },
            child: new Image.asset('assets/images/biggy.png'),
          ));
    }

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: new Image.asset(
            'assets/images/salmonbackground.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: logOut(),
                  ),
                ),
                SizedBox(height: 20.0),
                workingsStack(),
                SizedBox(height: 50.0),
                testimonyButton(),
              ],
            )),
        Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: deviceHeight/16),
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        padding:
                            EdgeInsets.only(bottom: deviceHeight / 6, left: 10.0, right: 10.0),
                        child: uploadPraiseButton()),
                    Container(
                        padding:
                            EdgeInsets.only(top: deviceHeight / 5, left: 10.0, right: 10.0),
                        child: viewVineyardButton()),
                    Container(
                        padding:
                            EdgeInsets.only(bottom: deviceHeight / 6, left: 10.0, right: 10.0),
                        child: uploadRequestButton())
                  ],
                ))),
      ],
    ));
  }
}
