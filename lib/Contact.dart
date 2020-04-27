import 'package:flutter/material.dart';
class Contact extends StatelessWidget {
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
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios
            ),
          ),
          title: Text('Contact'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  backgroundImage: AssetImage('images/profile.png'),
                radius: 40.0,
              ),
              Text('Muhammad Zubair Afzal'.toUpperCase()),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.pink,
                  thickness: 2.0,
                ),
              ),
              Text('Andriod Developer'.toUpperCase()),
              Information(icon: Icons.phone,text: '92311-4598019',),
              Information(icon: Icons.email,text: 'zubairafzal621@gmail.com',),
        ],
        ),
      ),
      ),);
  }
}

class Information extends StatelessWidget {
   final IconData icon;
   final String text;
   Information({@required this.icon,this.text});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
          leading: Icon(icon,color: Colors.pink,),
        title: Text(
          text
        ),

       ),
    );
  }
}

