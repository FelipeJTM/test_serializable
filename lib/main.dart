import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_serializable_test/user.dart';

import 'model/address.dart';
import 'model/my_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        onPressed: () {
          String json = '{"id":1,"name": null,"email": null}';

          print("----------JSON serializer Simple------------");

          print('El Json inicial es: ${json}');

          Map<String, dynamic> userMap = jsonDecode(json);

          var user = User.fromJson(userMap);

          print('El usuario es: ${user.name} and the email is ${user.email}');



          print("----------JSON serializer with nested classes------------");

          Address address = Address("My st.", "New York");

          MyUser myUser = MyUser("John", address);

          print(myUser.toJson());

          var x = myUser.toJson();
          var y = MyUser.fromJson(x);
          print(y);
          print(y.name);
          print(y.address.street);
          print(y.address.city);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
