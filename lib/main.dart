import 'package:coronaapp/Contact.dart';
import 'package:flutter/material.dart';
import 'package:coronaapp/mainPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF282A36),
          primaryColor: Colors.pink
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('COVID-19',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          actions: <Widget>[
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return Contact();
                    }));
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body:CoronaApp() ,
      ),
    );
  }
}

