import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_vision_revival/bloc/bloc_getRequests.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:async/async.dart';
import 'dart:convert';

class DoubleHolder {
  double value = 0.0;
}

class InfiniteRequestView extends StatefulWidget {
  final DoubleHolder offset = new DoubleHolder();

  InfiniteRequestView({Key key}) : super(key: key);

  double getOffset() {
    return offset.value;
  }

  void setOffset(double value) {
    offset.value = value;
  }

  @override
  _InfiniteRequestViewState createState() => _InfiniteRequestViewState();
}

class _InfiniteRequestViewState extends State<InfiniteRequestView> {
  List<String> listRequests = new List();

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController =
        ScrollController(initialScrollOffset: widget.getOffset());
    fetchTwenty();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchTwenty();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new NotificationListener(
        child: new ListView.builder(
          controller: _scrollController,
          itemCount: listRequests.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child:
                    Image.network(listRequests[index], fit: BoxFit.fitWidth));
          },
        ),
        onNotification: (notification) {
          if (notification is ScrollNotification) {
            widget.setOffset(notification.metrics.pixels);
          }
        },
      ),
    );
  }

  Widget getOneRequest(String src) {
    return new Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Image.network(src, fit: BoxFit.fitWidth),
    );
  }

  void fetch() async {
    final response = await http.get("https://dog.ceo/api/breeds/image/random");
    if (response.statusCode == 200) {
      setState(() {
        listRequests.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to Load an image');
    }
  }

  void fetchTwenty() {
    for (int i = 0; i < 5; i++) {
      fetch();
    }
  }
}
