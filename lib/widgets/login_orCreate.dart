import 'package:flutter/material.dart';

class OrCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(border: Border.all(width: 0.25)),
            ),
          ),
          Text(
            "OR CONNECT WITH",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          new Expanded(
            child: new Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(border: Border.all(width: 0.25)),
            ),
          ),
        ],
      ),
    )
    );
  }
}