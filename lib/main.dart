import 'package:demo/home/home.dart';
import 'package:demo/login/login.dart';
import 'package:demo/services/authentication_service.dart';
import 'package:demo/services/bored_service.dart';
import 'package:demo/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => BoredService(),
          ),
          RepositoryProvider(
            create: (context) => ConnectivityService(),
          ),
          RepositoryProvider(
            create: (context) => AuthenticationService(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
