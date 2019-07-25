import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_vision_revival/models/model_user.dart';
import 'package:project_vision_revival/pages/page_testimony.dart';

class ShortBio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = 'Zhong Can';
    String verse = 'Ephesians 6: 10 - 18';

    double deviceHeight = MediaQuery.of(context).size.height ;
    double thirdh = deviceHeight * .33;
    double deviceWidth = MediaQuery.of(context).size.width;
    double thirdw = deviceWidth * .33;

    return new Container(
      padding: EdgeInsets.only(top: 50),
        height: thirdh,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: thirdw,
              width: thirdw,
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: new Image.asset(
                    'assets/images/biggy.png',
                    fit: BoxFit.scaleDown,
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
                height: (thirdh - 90),
                width: deviceWidth - thirdw,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      height: (thirdh - 70) * .2 - 10,
                      width: deviceWidth - thirdw,
                      child:  Text(
                          '${verse}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),


                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
                      height: (thirdh - 90) * .3 - 20,
                      width: deviceWidth - thirdw,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        child: Text(
                          '${verse}',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(
                          color: Colors.black12,
                          width: 0.5,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 0.0),
                      height: (thirdh - 90) * .6 - 20,
                      width: deviceWidth - thirdw,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                        child: Column(
                          children: <Widget>[
                            Text('My Name is Zhong Can'),
                            Container(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                    iconSize: 10.0,
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => new AlertDialog(
                                                title: new Text("Bio"),
                                                content: new Text(
                                                    "This is additional Information about me"),
                                              ));
                                    })),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.black12,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
