import 'package:flutter/material.dart';
import 'package:project_vision_revival/widgets/widget_infiniteRequest.dart';
import 'package:project_vision_revival/widgets/widget_bio.dart';
import 'package:project_vision_revival/pages/page_testimony.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:project_vision_revival/models/model_user.dart';
import 'package:project_vision_revival/api/dbapi.dart';
import 'package:project_vision_revival/main.dart';
import 'package:project_vision_revival/api/dbapi.dart';

class ViewTestimonySheet extends StatefulWidget {
  ViewTestimonySheet(
      {Key key, this.getOffset, this.setOffset, this.listTestimony})
      : super(key: key);

  final GetOffsetMethod getOffset;
  final SetOffsetMethod setOffset;
  final List<String> listTestimony;

  @override
  _ViewTestimonySheetState createState() => _ViewTestimonySheetState();
}

class _ViewTestimonySheetState extends State<ViewTestimonySheet> {
  ScrollController _testimonyController;

  @override
  void initState() {
    super.initState();
    _testimonyController =
        new ScrollController(initialScrollOffset: widget.getOffset());
    api.fetchFiveTestimony(this.context);
  }

  @override
  Widget build(BuildContext context) {
    _testimonyController.addListener(() {
      if (_testimonyController.position.pixels ==
          _testimonyController.position.maxScrollExtent) {
        api.fetchFiveTestimony(this.context);
      }
    });

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.width;

    return Container(
      height: deviceHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.001), BlendMode.dstATop),
          image: AssetImage('assets/images/initialcrosstheme.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Expanded(
        child: new NotificationListener(
          child: new ListView.builder(
            controller: _testimonyController,
            itemCount: widget.listTestimony.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: Image.network(
                        widget.listTestimony[index],
                        fit: BoxFit.fitWidth,
                      )));
            },
          ),
          onNotification: (notification) {
            if (notification is ScrollNotification) {
              widget.setOffset(notification.metrics.pixels);
            }
          },
        ),
      ),
    );
  }
}
