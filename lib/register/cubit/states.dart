

import 'package:task0000/login_model.dart';


abstract class RegisterState {}
class RegisterInitialState extends RegisterState{}

class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState {
  late  ShopLoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}
class RegisterErrorState extends RegisterState{
  final String error ;
  RegisterErrorState(this.error);
}


class ShopSuccessState extends RegisterState {
  // late  ShopLoginModel loginModel;

  //ShopSuccessState(this.loginModel);
}
class ShopErrorState extends RegisterState{
  final String error ;
  ShopErrorState(this.error);
}


class ShopDataSuccessState extends RegisterState{}

class ShopDataErrorState extends RegisterState{}
class ChangePasswordVisibilityState extends RegisterState{}