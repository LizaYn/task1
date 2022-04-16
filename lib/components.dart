import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';
import 'register/model products.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: background,
      ),
    );

Widget defaultTextBottom({required Function function, required String text}) =>
    TextButton(
        onPressed: () {
          function();
        },
        child: Text(text.toUpperCase()));

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUSSESS, ERROR, EARNING }
Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUSSESS:
      color = Colors.green;
      break;
    case ToastStates.EARNING:
      color = Colors.yellow;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

// for lock the previous pages
void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => Widget),
  // if false delete the previous page if ture keep it
      (Route<dynamic> route) => false,
);

Widget buildArticleItem(Data article, context) => InkWell(
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,

          decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),

      image: DecorationImage(

        fit: BoxFit.cover,
        image:NetworkImage('https://th.bing.com/th/id/R.96fc381b40fd904dd4519de44779fbc9?rik=CIV489H21mwwXw&pid=ImgRaw&r=0&sres=1&sresct=1'),

        //NetworkImage('${article['urlToImage']}'),

      )

  ),


        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(' ${article.name}'),
                ),
                //  ),
                Text('${article.info}'),

                Text('${article.price}'),

              ],
            ),
          ),
        )
      ],
    ),
  ),
);
