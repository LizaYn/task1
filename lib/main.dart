import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task0000/components.dart';
import 'package:task0000/login/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:task0000/productsFire.dart';
import 'package:task0000/register/cubit/cubit.dart';
import 'package:task0000/register/cubit/states.dart';
import 'package:task0000/register/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<RegisterCubit>(
        create: (BuildContext context) => RegisterCubit()..getDataFire(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = RegisterCubit.get(context);
              return

                MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(

                    primarySwatch: Colors.blue,
                  ),
                  home: Splash(),
                );
            }
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 170,
                height: 170,
                child:
                Image(image:AssetImage('assets/images/food.jpg'),

                ),),
              SizedBox(height: 20,),
              Text('About Us : ', style: TextStyle(color: Colors.black, fontWeight:
              FontWeight.bold, fontSize: 40),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.all(40),
                child: Text( 'Retro Gifts & Accessories in the Gifts By Turnstile section will take 72 hours and will be shipped separately from any other products. ',
                  style: TextStyle(color: Colors.black54, fontSize: 20),),
              ),
              SizedBox(height: 20,),
              IconButton(onPressed: (){
                navigateAndFinish(context, ShopLoginScreen());
              },
                icon: Icon(Icons.arrow_right),iconSize: 120,color: Colors.deepPurple,)

            ]
        ),
      ),
    );
  }
}
