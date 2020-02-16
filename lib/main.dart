import 'package:flutter/material.dart';
import 'package:random_user/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random User"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(child:  Text("Get a user!"),
            onPressed: (){
              getUser();
            },
            color:  Colors.yellow,
            ),
            FutureBuilder<User>(
              future: getUser(),
              builder: (context , snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: <Widget>[
                      Text(snapshot.data.name),
                      Text(snapshot.data.email),
                      Text(snapshot.data.dob),
                      Text(snapshot.data.address),
                      Text(snapshot.data.phone),
                    ]
                  );
                }else if(snapshot.hasError){
                  return Text("Something is wrong. Please try again");
                }else{
                  return Container();
                }
              }
            )
          ],
      ),)
    );
  }

  Future<User> getUser() async  {
    String url = "https://randomuser.me/api";

    final response = await http.get(url, headers: {"Application":"application/json"});
    print('Response status: ${response.statusCode}');
    if(response.statusCode == 200){
      return User.fromJson(json.decode(response.body));
    }else{
      throw Exception('failed to load');
    }
  }
}