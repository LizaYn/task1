
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task0000/login_model.dart';
import 'package:task0000/register/cubit/states.dart';
import 'package:task0000/register/model%20products.dart';



class RegisterCubit extends Cubit<RegisterState>{

  late  ShopLoginModel  loginModel;

  RegisterCubit() :super(RegisterInitialState());
  static RegisterCubit get(context)=> BlocProvider.of(context);

  void userRegister({
    required String email ,
    required String password ,
    required String name ,
    required String phone ,
  }){
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password).then((value) {
      print(value.user!.uid);
      emit(RegisterSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }



  // foooorrr data firebase




  List <Data> firedata =[];
  void getDataFire (){
    FirebaseFirestore.instance.collection('products').get().then((value) {
      value.docs.forEach((element) {
        firedata.add(Data.fromJson(element.data()));
      });
      print(firedata.toString());
      emit(ShopDataSuccessState());
    }).catchError((error){
      emit(ShopDataErrorState());
    });


  }







  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;
  void changePasswordVisibility(){
    isPasswordShown =! isPasswordShown;
    suffix= isPasswordShown? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }



}