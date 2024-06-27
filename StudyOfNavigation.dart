import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.grey),
        //home: HomePage(),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          RoutePink.routeName: (context) => RoutePink(),
          RouteGreen.routeName: (context) => RouteGreen(),
          RouteGrey.routeName: (context) => RouteGrey(),
        });
  }
}

class HomePage extends StatelessWidget {
  static String routeName = '/';
  final User kullanici = User(age : 17,name : 'Batuhan');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('HomePage'),
        TextButton(
            child: Text('Git -> Route Pink'),
            onPressed: () {
              Navigator.pushNamed(context, RoutePink.routeName,arguments:kullanici);
            })
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////
class RoutePink extends StatelessWidget {
  static String routeName = '/routePink';
  @override
  Widget build(BuildContext context) {
    final User? yerelkullanici=ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Hoşgeldiniz  ${yerelkullanici?.name} Yaş : ${yerelkullanici?.age}'),
        TextButton(
            child: Text('Git -> Route Green'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGreen.routeName);
            }),
       TextButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////
class RouteGreen extends StatelessWidget {
  static String routeName = '/routeGreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RouteGreen en üstte'),
        TextButton(
            child: Text('Git -> Route Grey'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGrey.routeName);
            }),
        TextButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////
class RouteGrey extends StatelessWidget {
  static String routeName = '/routeGrey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RouteGrey en üstte'),
        TextButton(child: Text('Git -> ....'), onPressed: () {}),
        TextButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

class User{
  String? name;
  int? age;
  User({this.age,this.name});
}