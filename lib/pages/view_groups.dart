import 'package:flutter/material.dart';

class ViewGroupSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      child: new Container(
        alignment: Alignment.center,
        child: Text('This is the Groups'),
      ),
    );
  }
}
