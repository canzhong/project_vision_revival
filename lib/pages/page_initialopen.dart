//import 'dart:math';
import 'package:project_vision_revival/bloc/bloc_loginstatus.dart';
import 'package:flutter/material.dart';
import 'package:project_vision_revival/bloc/bloc_login.dart';
import 'package:project_vision_revival/providers/provider_generic.dart';
import 'dart:async';
import 'package:project_vision_revival/pages/page_home.dart';
import 'package:project_vision_revival/models/model_user.dart';
import 'package:project_vision_revival/pages/page_loginloading.dart';
import 'package:provider/provider.dart';
import 'package:project_vision_revival/models/model_device.dart';
import 'package:project_vision_revival/api/auth_simulator.dart';
import 'package:project_vision_revival/main.dart';

class InitialOpen extends StatefulWidget {
  @override
  _InitialOpenState createState() => new _InitialOpenState();
}

class _InitialOpenState extends State<InitialOpen>
    with TickerProviderStateMixin {
  var _loggedin = false;
  var goodEmail = '';
  var _message = '';
  var _message2 = '';
  User _user = null;

  @override
  void initState() {
    super.initState();
  }

  bool quickCheck(String user, String pass) {
    return (user.contains('@') && (pass.length > 6));
  }

  bool quickCheck2(String user, String pass, String pass2) {
    return (user.contains('@') && (pass.length > 6) && (pass == pass2));
  }

  //We will not provide different sections of the initial Page.
  //Ideally I want to have the first (middle) page to be a page where guests can hear a prayer from me or a relevant leader or a personalized prayer from a member in the community
  // FirstPage (LoginPage) SecondPage(InitialPage) ThirdPage(CreateAccountPage)
  Widget SecondPage(loginBloc) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.81), BlendMode.dstATop),
          image: AssetImage('assets/images/background1.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: deviceHeight / 3),
            child: Center(
              child: Container(
                height: deviceHeight / 5,
                child:
                    Image.asset('assets/images/biggy.png', color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: deviceHeight / 32),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Vis",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                  ),
                ),
                Text(
                  "VIVAL",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: 30.0, right: 30.0, top: deviceHeight / 32),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new OutlineButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.redAccent,
                    highlightedBorderColor: Colors.white,
                    onPressed: () => gotoSignup(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "I Need A Revival",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    onPressed: () => gotoLogin(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "I Need To Worship",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //thirdPage is Creating an account
  Widget ThirdPage(loginBloc) {
    String _createemail = '';
    String _createpassword1 = '';
    String _createpassword2 = '';

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.025), BlendMode.dstATop),
          image: AssetImage('assets/images/initialcrosstheme.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(100.0),
            child: Column(
              children: <Widget>[
                Text(
                  'The Kingdom Welcomes You',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'With Open Arms',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 32),
          Text(_message2,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new StreamBuilder<String>(
              stream: loginBloc.createoutUsername,
              builder: (context, snapshot) {
                return new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          onChanged: (value) {
                            _createemail = value;
                            loginBloc.createemailChanged.add(value);
                          },
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'example@kingdom.com',
                            hintStyle: TextStyle(color: Colors.grey),
                            errorText: snapshot.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new StreamBuilder<String>(
            stream: loginBloc.createoutPassword1,
            builder: (context, snapshot) {
              return new Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.redAccent,
                        width: 0.5,
                        style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Expanded(
                      child: TextField(
                        onChanged: (value) {
                          _createpassword1 = value;
                          loginBloc.createpassword1Changed.add(value);
                        },
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorText: snapshot.error,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "CONFIRM PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new StreamBuilder<String>(
              stream: loginBloc.createoutPassword2,
              builder: (context, snapshot) {
                return new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          onChanged: (value) {
                            _createpassword2 = value;
                            loginBloc.createpasswordChanged2.add(value);
                          },
                          obscureText: true,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            errorText: snapshot.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Divider(
            height: 24.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Andrew\'s Code",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    onPressed: () {
                      setState(() => this._message = 'Creating Account Loading');

                      appAuth.login().then((result) {
                        if (result) {
                          Navigator.of(context).pushReplacementNamed("/home");
                        } else {
                          setState(() => this._message =
                              "Incorrect Fields");
                        }
                      });
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.redAccent,
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "I AM READY",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //ThirdPage is to sign in.
  Widget FirstPage(loginBloc) {
    String _email = '';
    String _password = '';

    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.025), BlendMode.dstATop),
          image: AssetImage('assets/images/initialcrosstheme.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: deviceHeight / 5),
            child: Center(
              child: Container(
                height: deviceHeight / 7,
                child: Image.asset('assets/images/biggy.png',
                    color: Colors.redAccent),
              ),
            ),
          ),
          SizedBox(
              height: deviceHeight / 12,
              child: Text(_message,
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold))),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new StreamBuilder<String>(
              stream: loginBloc.loginoutUsername,
              builder: (context, snapshot) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          onChanged: (value) {
                            _email = value;
                            loginBloc.loginUsername.add(value);
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'example@kingdom.com',
                            hintStyle: TextStyle(color: Colors.grey),
                            errorText: snapshot.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new StreamBuilder<String>(
              stream: loginBloc.loginoutPassword,
              builder: (context, snapshot) {
                return new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          obscureText: true,
                          onChanged: (value) {
                            _password = value;
                            loginBloc.loginPassword.add(value);
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Divider(
            height: 24.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.redAccent,
                    onPressed: () {
                      setState(() => this._message = 'loading');

                      appAuth.login().then((result) {
                        if (result) {
                          Navigator.of(context).pushReplacementNamed("/home");
                        } else {
                          setState(() => this._message =
                              "Rejected : Username or Passwored Incorrect");
                        }
                      });
                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
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
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Color(0Xff3B5998),
                            onPressed: () => {},
                            child: new Container(
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      onPressed: () => {},
                                      padding: EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(
                                            const IconData(0xea90),
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                          Text(
                                            "FACEBOOK",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(left: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Color(0Xffdb3236),
                            onPressed: () => {},
                            child: new Container(
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      onPressed: () => {},
                                      padding: EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(
                                            const IconData(0xea88),
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                          Text(
                                            "GOOGLE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);

    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  PageController _controller = new PageController(
    keepPage: false,
    initialPage: 1,
    viewportFraction: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    Widget first = FirstPage(loginBloc);
    Widget second = SecondPage(loginBloc);
    Widget third = ThirdPage(loginBloc);

    return new Scaffold(
        body: PageView(
      controller: _controller,
      physics: new AlwaysScrollableScrollPhysics(),
      children: <Widget>[first, second, third],
      scrollDirection: Axis.horizontal,
    ));
  }
}
