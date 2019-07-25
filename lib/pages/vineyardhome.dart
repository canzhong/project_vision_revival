import 'package:flutter/cupertino.dart';
import 'package:project_vision_revival/pages/view_vineyard.dart';
import 'package:project_vision_revival/pages/view_leaves.dart';
import 'package:project_vision_revival/pages/view_groups.dart';
import 'package:provider/provider.dart';

//import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:project_vision_revival/api/dbapi.dart';
import 'package:project_vision_revival/models/model_user.dart';
import 'package:project_vision_revival/pages/page_home.dart';
import 'package:project_vision_revival/bloc/bloc_loginstatus.dart';

import 'package:project_vision_revival/models/model_device.dart';
import 'package:project_vision_revival/widgets/widget_logout.dart';

class Vineyard extends StatefulWidget {
  @override
  _VineyardState createState() => _VineyardState();
}

class _VineyardState extends State<Vineyard> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;


    PageController _vineyardController = new PageController(
      keepPage: false,
      initialPage: 0,
      viewportFraction: 1.0,
    );

    Widget vineyard = ViewVineyardSheet();
    Widget groups = ViewGroupSheet();
    Widget leaves = ViewLeavesSheet();

    return new Scaffold(
      body: PageView(
        controller: _vineyardController,
        physics: new AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          vineyard,
          groups,
          leaves,
        ],
        scrollDirection: Axis.horizontal,
      ),

    );
  }
}
