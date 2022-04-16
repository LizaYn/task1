



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task0000/components.dart';
import 'package:task0000/firstpage.dart';
import 'package:task0000/login/cubit/cubit.dart';
import 'package:task0000/login/cubit/states.dart';
import 'package:task0000/productsFire.dart';
import 'package:task0000/register/register.dart';



class ShopLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
        create:  (BuildContext context )=> ShopLoginCubit(),
        child: BlocConsumer <ShopLoginCubit, ShopLoginState>(
          listener:  (context, state) {
            if(state is ShopLoginSuccessState){
              // if( state.loginModel.status! ){
              // print(state.loginModel.message);
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

              // }
              // else{
              //    showToast(
              //       text: state.loginModel.message!,
              //      state: ToastStates.ERROR);
              //  }

            }


            // if state is exp => navigatTo >...
          },
          builder: (context,state,){
            return  Scaffold(
              appBar: AppBar(
                title: Text('Login screen'),
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
                          Text('Login',
                            style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black,

                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('login now to browse our hot offers',
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Colors.black12
                            ),
                          ),
                          SizedBox(height: 30,),
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


                              // controller: passwordController,
                              decoration: const InputDecoration(

                                border: OutlineInputBorder(),
                                labelText: 'Password',),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'password must not be empty';
                                }}


                          ),










                          /*
                          defaultFormField(
                              controller: passwordController,
                              onSubmit:(value){
                                if(formKey.currentState!.validate()){
                                  ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);

                                }


                              } ,
                              type: TextInputType.visiblePassword,
                              sufix: ShopLoginCubit.get(context).suffix,
                              suffixPressed: (){
                                ShopLoginCubit.get(context).changePasswordVisibility();
                              },
                              validate: (String value){
                                if(value.isEmpty){
                                  return 'password is too short ';
                                }
                              },
                              label: 'Password',
                              ispassword: ShopLoginCubit.get(context).isPasswordShown,
                              prifex: Icons.lock_outline),

                          */

                          SizedBox(height: 30,),
                          ConditionalBuilder(
                            condition: state is ! ShopLoginLoadingState,
                            builder: (context)=>

                                defaultButton(function: (){
                                  if(formKey.currentState!.validate()){
                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    print(emailController);
                                    print(passwordController);
                                    navigateAndFinish(context, DataScreen());
                                  }
                                },
                                    text:'login',
                                    isUpperCase: true),



                            fallback:(context)=> Center(child: CircularProgressIndicator()),

                          ),















                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(" don't have an account ? "),
                              defaultTextBottom(
                                  function:(){ navigateTo(context, RegisterPScreen());},
                                  text:'register')
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
        )

    );
  }
}
