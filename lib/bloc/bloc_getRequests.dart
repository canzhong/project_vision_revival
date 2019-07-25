import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

class BlocRequest {

  List<StatelessWidget> requests = new List();

  Widget getOneRequest(String src) {
    return new Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Image.network(src, fit: BoxFit.fitWidth),
    );
  }

  void fetchTwenty() async {
    for (int i=0; i<20; i++) {
      final response = await http.get("dog.ceo/pi/breeds/image/random");
      if(response.statusCode == 200) {
        requests.add(getOneRequest(json.decode(response.body)['message']));
      } else {
        throw Exception('Failed to Load an image');
      }
    }
  }

}