import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_bloc/blocs/counter/counter_bloc.dart';
import 'package:password_bloc/blocs/counter/counter_event.dart';
import 'package:password_bloc/blocs/counter/counter_state.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  bool isIncrementing = true;
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BLoC ' + (isIncrementing ? 'add' : 'remove')),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder(
              bloc: counterBloc,
              builder: (context, CounterState state) {
                return Text(state.value.toString());
              },
            ),
            Switch(
              value: isIncrementing,
              onChanged: (bool newValue) {
                setState(() {
                  isIncrementing = newValue;
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: isIncrementing
          ? FloatingActionButton(
              child: Icon(isIncrementing ? Icons.add : Icons.add),
              onPressed: () => counterBloc.dispatch(Increment()),
            )
          : FloatingActionButton(
              child: Icon(isIncrementing ? Icons.add : Icons.remove),
              onPressed: () => counterBloc.dispatch(Decrement()),
            ),
    );
  }
}
