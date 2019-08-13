import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_bloc/blocs/tictactoe/tictactoe_bloc.dart';
import 'package:password_bloc/blocs/tictactoe/tictactoe_event.dart';
import 'package:password_bloc/blocs/tictactoe/tictactoe_state.dart';

class Tictactoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TictactoeBloc tttBloc = BlocProvider.of<TictactoeBloc>(context);

    List<Widget> _mapBoard(TictactoeState state) {
      final List<Widget> tiles = [];
      final board = state.board;

      var callback = (int i, int j) => tttBloc.dispatch(DoPlay(i, j));

      for (int i = 0; i < board.length; i++) {
        List<Play> row = board[i];
        for (int j = 0; j < row.length; j++) {
          tiles.add(
            RaisedButton(
                child: _createTile(row[j]),
                onPressed:
                    (board[i][j] == Play.none && state.runtimeType == Playing)
                        ? () {
                            callback(i, j);
                          }
                        : null),
          );
        }
      }

      return tiles;
    }

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
                builder: (context, TictactoeState state) {
                  if (state is HasWinner) {
                    Future.delayed(
                        Duration.zero,
                        () => Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Yey! The ${state.currentPlayer.toString().split('.').last} wins!'),
                            )));
                  }

                  return GridView.count(
                    crossAxisCount: 3,
                    children: _mapBoard(state),
                  );
                },
              ),
            ),
            Builder(
              builder: (context) {
                return RaisedButton(
                  child: Text('Reset'),
                  onPressed: () {
                    tttBloc.dispatch(Reset());
                  },
                );
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
      case Play.o:
        tile = Icon(Icons.fiber_manual_record);
        break;
      default:
        tile = null;
    }

    return tile;
  }
}
