import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginViewStates> {
  Dio dio;
  LoginViewModel(this.dio) : super(LoginViewStates());
}

class LoginViewStates {}
