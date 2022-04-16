



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task0000/components.dart';
import 'package:task0000/firstpage.dart';
import 'package:task0000/login/login.dart';
import 'package:task0000/productsFire.dart';
import 'package:task0000/register/cubit/cubit.dart';
import 'package:task0000/register/cubit/states.dart';

class RegisterPScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();


    return BlocConsumer <RegisterCubit, RegisterState>(
      listener:  (context, state) {
        if(state is RegisterSuccessState){

            navigateAndFinish(context, FirstPage());

            //  Fluttertoast.showToast(
            //     msg: state.loginModel.message,
            //     toastLength: Toast.LENGTH_LONG,
            //   gravity: ToastGravity.BOTTOM,
            //   timeInSecForIosWeb: 1,
            //   backgroundColor: Colors.green,
            //   textColor: Colors.white,
            //  fontSize: 16.0
            // );


        }


        // if state is exp => navigatTo >...
      },
      builder: (context,state,){
        return  Scaffold(
          appBar: AppBar(
            title: Text('Register screen'),
          ),
          body:
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Register',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.black,

                        ),
                      ),
                      SizedBox(height: 15,),

                      Text('Register now to browse our hot offers',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.black12
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(


                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Name must not be empty';
                            }}


                      ),

                      SizedBox(height: 20,),

                      TextFormField(


                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'email address must not be empty';
                            }}


                      ),
                      SizedBox(height: 20,),

                      TextFormField(

                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'password must not be empty';
                            }}


                      ),


                      //    label: 'Password',
                      //  ispassword: RegisterCubit.get(context).isPasswordShown,
                      //prifex: Icons.lock_outline),

                      SizedBox(height: 30,),


                      TextFormField(


                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone Number',),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'phone number must not be empty';
                            }}


                      ),



                      SizedBox(height: 30,),
                      ConditionalBuilder(
                        condition: state is ! RegisterLoadingState,
                        builder: (context)=>

                            defaultButton(function: (){
                              if(formKey.currentState!.validate()){
                                RegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwordController.text

                                );
                                navigateAndFinish(context,DataScreen());
                              }
                            },
                                text:'Register',
                                isUpperCase: true),



                        fallback:(context)=> Center(child: CircularProgressIndicator()),

                      ),















                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" have an account ? "),
                          defaultTextBottom(
                              function:(){ navigateTo(context, ShopLoginScreen());},
                              text:'Login')
                        ],
                      )




                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
