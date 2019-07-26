import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_bloc/blocs/tictactoe/tictactoe_bloc.dart';

class Tictactoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TictactoeBloc tttBloc = BlocProvider.of<TictactoeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tictactoe BLoC'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'TicTacToe Game',
              style: Theme.of(context).textTheme.headline,
            ),
            Expanded(
              child: BlocBuilder(
                bloc: tttBloc,
                builder: (context, state) => GridView.count(
                  crossAxisCount: 3,
                  children: <Widget>[
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                    RaisedButton(
                      child: Icon(Icons.cancel),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
