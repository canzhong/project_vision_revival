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

class ViewRequestSheet extends StatefulWidget {

  ViewRequestSheet({Key key, this.getOffset, this.setOffset, this.listRequest}) : super(key: key);

  final GetOffsetMethod getOffset;
  final SetOffsetMethod setOffset;
  final List<String> listRequest;

  @override
  _ViewRequestSheetState createState() => _ViewRequestSheetState();

}

class _ViewRequestSheetState extends State<ViewRequestSheet> {

  ScrollController _requestController;


  @override
  void initState() {
    super.initState();
    _requestController = new ScrollController(initialScrollOffset: widget.getOffset());
    api.fetchFiveRequest(this.context);


  }

  @override
  Widget build(BuildContext context) {
    _requestController.addListener(() {
      if (_requestController.position.pixels ==
          _requestController.position.maxScrollExtent) {
        api.fetchFiveRequest(this.context);
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
      child: Column(
        children: <Widget>[
          new ShortBio(),
          new Expanded(
            child: new NotificationListener(
              child: new ListView.builder(
                controller: _requestController,
                itemCount: widget.listRequest.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                          child: Image.network(widget.listRequest[index], fit: BoxFit.fitWidth,)
                      )
                  );
                },
              ),
            onNotification: (notification) {
                if (notification is ScrollNotification) {
                  widget.setOffset(notification.metrics.pixels);
                }
            },
          ),
          ),
        ],
      )

    );
  }



}