import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task0000/components.dart';
import 'package:task0000/register/cubit/cubit.dart';
import 'package:task0000/register/cubit/states.dart';




class  DataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context, state) {},
      builder: (context,state){

        var list = RegisterCubit.get(context).firedata;

        return  Scaffold(
          appBar: AppBar(
            title: Text('Products screen'),
          ),
            body:
            Padding(padding: EdgeInsets.all(15),
              child: Container(



                  child:

                  buildArticleItem(list[0] ,context),

            )


            ));
      },




    );
  }
}


