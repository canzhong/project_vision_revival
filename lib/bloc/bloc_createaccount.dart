import 'dart:async';
import 'package:project_vision_revival/providers/provider_generic.dart';
//import 'package:project_vision_revival/api/dbapi.dart';
import 'package:project_vision_revival/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class CreateAccountBloc with Validators implements BlocBase {
  //String _username;
  //String _password1;
  //String _password2;

  final _usernameController = BehaviorSubject<String>();
  final _password1Controller = BehaviorSubject<String>();
  final _password2Controller = BehaviorSubject<String>();

  StreamSink<String> get emailChanged => _usernameController.sink;
  StreamSink<String> get password1Changed => _password1Controller.sink;
  StreamSink<String> get password2Changed => _password2Controller.sink;

  Stream<String> get outUsername => _usernameController.stream.transform(emailValidator);
  Stream<String> get outPassword1 => _password1Controller.stream.transform(passwordValidator);
  Stream<String> get outPassword2 => _password2Controller.stream.transform(password2Validator);

  Stream<bool> get submitCheck => Observable.combineLatest3(outUsername, outPassword1, outPassword2, (e, p2, p3) => true);

  submit() {
    print("XYZ");
  }

  @override
  void dispose() {

    _usernameController.close();
    _password1Controller.close();
    _password2Controller.close();
  }

  bool validate(String username, String password, String password2) {
    if (username.contains('@') || password.length < 4 || password != password2) {
      return false;
    }
    return true;
  }
}
