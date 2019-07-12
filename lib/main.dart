import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_bloc/screens/password_list.dart';

import 'blocs/password/password_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Password Bloc'),

        ),
        body: BlocProvider(
          builder: (BuildContext context) => PasswordBloc(),
          child: PasswordList(),
        ),
      ),
      routes: {
        'password_list': (context) => PasswordList()
      },
    );
  }
}
