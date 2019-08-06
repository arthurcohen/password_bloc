import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_bloc/blocs/tictactoe/tictactoe_bloc.dart';
import 'package:password_bloc/blocs/tictactoe/tictactoe_event.dart';
import 'package:password_bloc/blocs/tictactoe/tictactoe_state.dart';

class Tictactoe extends StatefulWidget {
  @override
  _TictactoeState createState() => _TictactoeState();
}

class _TictactoeState extends State<Tictactoe> {
  TictactoeBloc tttBloc;
  Play _play = Play.x;

  @override
  Widget build(BuildContext context) {
    tttBloc = BlocProvider.of<TictactoeBloc>(context);

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
                builder: (context, TictactoeState state) => GridView.count(
                  crossAxisCount: 3,
                  children: _mapBoard(state.board, _play),
                ),
              ),
            ),
            RaisedButton(
              child: Text('Reset'),
              onPressed: () {
                tttBloc.dispatch(Reset());
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTile(Play play) {
    Widget tile;

    switch (play) {
      case Play.x:
        tile = Icon(Icons.clear);
        break;
      case Play.y:
        tile = Icon(Icons.crop_din);
        break;
      default:
        tile = null;
    }

    return tile;
  }

  List<Widget> _mapBoard(List<List<Play>> board, Play play) {
    final List<Widget> tiles = [];

    for (int i = 0; i < board.length; i++) {
      List<Play> row = board[i];
      for (int j = 0; j < row.length; j++) {
        tiles.add(
          RaisedButton(
              child: _createTile(row[j]),
              onPressed: board[i][j] == Play.none
                  ? () {
                      tttBloc.dispatch(DoPlay(i, j));
                      setState(() {});
                    }
                  : null),
        );
      }
    }

    return tiles;
  }
}
