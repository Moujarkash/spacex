import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex/view/pages/home_page.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case '/':
            return CupertinoPageRoute(builder: (context) =>  HomePage());
        }
        return null;
      },
    );
  }
}
