import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:password_bloc/model/player.dart';

@immutable
abstract class TictactoeState extends Equatable {
  final Player playerOne;
  final Player playerTwo;
  final List<List<Play>> board;

  TictactoeState(this.playerOne, this.playerTwo, this.board,
      {List<dynamic> props = const <dynamic>[]})
      : super([playerOne, playerTwo, board]..addAll(props));

  static clearBoard() => List<List<Play>>.generate(
      3, (i) => List<Play>.generate(3, (j) => Play.none));
}

class HasWinner extends TictactoeState {
  final Player winner;

  HasWinner(playerOne, playerTwo, board, this.winner)
      : super(playerOne, playerTwo, board);
}

class IsDraw extends TictactoeState {
  IsDraw(playerOne, playerTwo, board) : super(playerOne, playerTwo, board);
}

class Playing extends TictactoeState {
  final Play currentPlayer;

  Playing(playerOne, playerTwo, board, this.currentPlayer)
      : super(playerOne, playerTwo, board, props: [currentPlayer]);
}

enum Play { none, x, y }
