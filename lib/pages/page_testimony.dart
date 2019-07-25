import 'package:flutter/cupertino.dart';
import 'package:project_vision_revival/pages/view_media.dart';
import 'package:project_vision_revival/pages/view_testimony.dart';
import 'package:project_vision_revival/pages/view_userrequests.dart';
import 'package:provider/provider.dart';

//import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:project_vision_revival/api/dbapi.dart';
import 'package:project_vision_revival/models/model_user.dart';
import 'package:project_vision_revival/pages/page_home.dart';
import 'package:project_vision_revival/bloc/bloc_loginstatus.dart';

import 'package:project_vision_revival/models/model_device.dart';
import 'package:project_vision_revival/widgets/widget_logout.dart';

typedef double GetOffsetMethod();
typedef void SetOffsetMethod(double offset);

class Testimony extends StatefulWidget {
  @override
  _TestimonyState createState() => _TestimonyState();
}

class _TestimonyState extends State<Testimony> {
  List<String> listRequests = new List();
  List<String> listTestimony = new List();
  List<String> listVineyard = new List();


  double _testimonyRequestOffset = 0.0;
  double _testimonyTestimonyOffset = 0.0;
  double _testimonyVineyardOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    testimonyButton() {
      return new Container(
          padding: EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
          width: deviceWidth / 5,
          height: deviceWidth / 5,
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: new FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/welcome');
            },
            child: new Image.asset('assets/images/biggy.png'),
          ));
    }

    PageController _testimonyController = new PageController(
      keepPage: true,
      initialPage: 0,
      viewportFraction: 1.0,
    );

    final Widget testimony = ViewTestimonySheet();
    final Widget media = ViewMediaSheet();

    return new Scaffold(
      body: PageView(
        controller: _testimonyController,
        physics: new AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          new ViewRequestSheet(
                getOffset: () => _testimonyRequestOffset,
                setOffset: (offset) => this._testimonyRequestOffset = offset,
                listRequest: listRequests,
              ),
          testimony,
          media,
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
