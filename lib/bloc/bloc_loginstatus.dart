import 'dart:async';
import 'package:project_vision_revival/providers/provider_generic.dart';



class LoginStatusBloc implements BlocBase {
  bool _loggedin;

  StreamController<bool> _loggedinController = StreamController<bool>.broadcast();
  Sink<bool> get _inLoggin => _loggedinController.sink;
  Stream<bool> get outLogin => _loggedinController.stream;

  LoginStatusBloc() {
    init();
  }

  void init() {
    _loggedin = false;
    _inLoggin.add(_loggedin);
  }

  @override
  void dispose() {
    _loggedinController.close();
  }

  void login(bool status) {
    _loggedin = status;
    _inLoggin.add(_loggedin);
  }

  void logout(bool status) {
    _loggedin = status;
    _inLoggin.add(_loggedin);
  }


}
