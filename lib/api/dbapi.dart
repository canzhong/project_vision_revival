import 'dart:convert';

import 'package:flutter/cupertino.dart' as prefix0;
import 'package:project_vision_revival/models/model_user.dart';

//import 'package:async/async.dart';
import 'package:tuple/tuple.dart';
import 'package:project_vision_revival/models/model_notification.dart';
import 'package:http/http.dart' as http;

class DBApi {
  var accounts = <Tuple2<String, String>>{
    new Tuple2('joseph0001@alfred.com', 'killer43'),
    new Tuple2('zhongcan@cc.com', 'invalid'),
    new Tuple2('maybe@good.good', 'not')
  };

  var details = <Tuple2<String, List<String>>>{
    new Tuple2('joseph0001@alfred.com', ['joseph', 'redding', '00000']),
    new Tuple2('zhongcan@cc.com', ['Can', 'Zhong', '74721']),
    new Tuple2('maybe@good.good', ['Mary', 'Lamb', '11111']),
  };

  var notifications = [
    Notification(
      'jose',
      'iloveyou',
    ),
    Notification('jesus', 'always'),
    Notification('extrodinary', 'love'),
    Notification('extrodinary', 'love'),
    Notification('extrodinary', 'love'),
    Notification('extrodinary', 'love'),
    Notification('extrodinary', 'love'),
    Notification('extrodinary', 'love'),
    Notification('extrodinary', 'love'),
  ];

  List<Notification> getNotifcations() {
    return notifications;
  }

  Future<User> getAsyncUser() async {
    await Future.delayed(Duration(seconds: 4));
    User _user = User('JosephSmith', 'Password');
    return _user;
  }

  int loginAccount(String email, String password) {
    return (accounts.contains(Tuple2(email, password))) ? 1 : 0;
  }

  int writeDB(String email, String password) {
    if (accounts.contains(email)) {
      return 0;
    }

    print(email);
    print(password);
    return 1;
  }

  void writeDBDetails(String email, List details) {
    details.add(Tuple2(email, details));
  }

  User getActualUser(String email, String password) {
    return new User(email, password);
  }

  void fetchRequest(context) async {
    final response = await http.get("https://dog.ceo/api/breeds/image/random");
    if (response.statusCode == 200) {
      context.setState(() {
        context.widget.listRequest.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to Load an image');
    }
  }

  void fetchFiveRequest(context) {
    for (int i = 0; i < 5; i++) {
      fetchRequest(context);
    }
  }

  void fetchTestimony(context) async {
    final response = await http.get("https://dog.ceo/api/breeds/image/random");
    if (response.statusCode == 200) {
      context.setState(() {
        context.widget.listTestimony.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to Load an image');
    }
  }

  void fetchFiveTestimony(context) {
    for (int i = 0; i < 5; i++) {
      fetchTestimony(context);
    }
  }

  void fetchVineyard(context) async {
    final response = await http.get("https://dog.ceo/api/breeds/image/random");
    if (response.statusCode == 200) {
      context.setState(() {
        context.widget.listVineyard.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to Load an image');
    }
  }

  void fetchFiveVineyard(context) {
    for (int i = 0; i < 5; i++) {
      fetchVineyard(context);
    }
  }
}

DBApi api = DBApi();
