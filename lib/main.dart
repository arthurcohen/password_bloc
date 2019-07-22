import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter/counter_bloc.dart';
import 'screens/counter.dart';
import 'screens/password_list.dart';

import 'blocs/password/password_bloc.dart';

import 'screens/dash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasswordBloc>(
          builder: (context) => PasswordBloc(),
        ),
        BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => Dash(),
          '/password_list': (context) => PasswordList(),
          '/counter': (context) => Counter(),
        },
        theme: Theme.of(context).copyWith(
            primaryColor: Color(0xff6699cc),
            secondaryHeaderColor: Color(0xff7bdff2),
            primaryColorDark: Color(0xff222222),
            accentColor: Color(0xfff93943),
            appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black))),
      ),
    );
  }
}
