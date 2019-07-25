import 'dart:async';
import 'package:project_vision_revival/providers/provider_generic.dart';
import 'package:project_vision_revival/api/dbapi.dart';
import 'package:project_vision_revival/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators implements BlocBase  {
  String _username;
  String _password;
  bool _send;

  //Stream Controllers for logging in
  StreamController<String> _loginusernameController = StreamController<String>.broadcast();
  StreamController<String> _loginpasswordController = StreamController<String>.broadcast();

  //Stream Controllers for creating account
  StreamController<String> _createusernameController = StreamController<String>.broadcast();
  StreamController<String> _createpassword1Controller = StreamController<String>.broadcast();
  StreamController<String> _createpassword2Controller = StreamController<String>.broadcast();

  //Stream sink for logging in
  StreamSink<String> get logininUsername => _loginusernameController.sink;
  StreamSink<String> get logininPassword => _loginpasswordController.sink;

  //Stream sink for creating account
  StreamSink<String> get createemailChanged => _createusernameController.sink;
  StreamSink<String> get createpassword1Changed => _createpassword1Controller.sink;
  StreamSink<String> get createpassword2Changed => _createpassword2Controller.sink;

  //Stream for login
  Stream<String> get loginoutUsername => _loginusernameController.stream;
  Stream<String> get loginoutPassword => _loginpasswordController.stream;

  //Stream for creating account
  Stream<String> get createoutUsername => _createusernameController.stream.transform(emailValidator);
  Stream<String> get createoutPassword1 => _createpassword1Controller.stream.transform(passwordValidator);
  Stream<String> get createoutPassword2 => _createpassword1Controller.stream.transform(password2Validator);




  submit() async {
    String user = await _loginusernameController.stream.single;


  }

  bool quickCheck(String user, String pass) {
    return ((user.contains('@') && (pass.length>6)));
  }



  bool goodEmail(String str) {
    return str.contains('@')?true:false;
  }

  bool goodPass(String str) {
    return str.length>6?true:false;
  }

  bool attemptLogin(String user, String pass) {

    int res = api.loginAccount(user, pass);

    return (res == 1 ? true : false);
  }

  bool attemptCreate(String user, String pass) {
    print(user);
    print(pass);
    return true;
  }

  @override
  void dispose() {
    _loginusernameController.close();
    _loginpasswordController.close();
    _createusernameController.close();
    _createpassword1Controller.close();
    _createpassword2Controller.close();

  }
}
