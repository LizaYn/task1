

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task0000/login/cubit/states.dart';
import 'package:task0000/login_model.dart';



class ShopLoginCubit extends Cubit<ShopLoginState>{

  late  ShopLoginModel  loginModel;

  ShopLoginCubit() :super(ShopLoginInitialState());
  static ShopLoginCubit get(context)=> BlocProvider.of(context);

  void userLogin({
    required dynamic email ,
    required dynamic password ,
  }){
    emit(ShopLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) {
      print(value.user!.email);
      print('im userlgin cubit $email');
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
      //  print(error.toString());
      emit(ShopLoginErrorState(error));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;
  void changePasswordVisibility(){
    isPasswordShown =! isPasswordShown;
    suffix= isPasswordShown? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }



}