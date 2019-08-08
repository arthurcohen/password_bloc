import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TictactoeState extends Equatable {
  final Play playerOne;
  final Play playerTwo;
  final List<List<Play>> board;

  TictactoeState(this.playerOne, this.playerTwo, this.board,
      {List<dynamic> props = const <dynamic>[]})
      : super([playerOne, playerTwo, board]..addAll(props));

  static clearBoard() => List<List<Play>>.generate(
      3, (i) => List<Play>.generate(3, (j) => Play.none));
}

class IsDraw extends TictactoeState {
  IsDraw(playerOne, playerTwo, board) : super(playerOne, playerTwo, board);
}

class Playing extends TictactoeState {
  final Play currentPlayer;

  Playing(playerOne, playerTwo, board, this.currentPlayer)
      : super(playerOne, playerTwo, board, props: [currentPlayer]);
}

class HasWinner extends Playing {

  HasWinner(playerOne, playerTwo, board, winner)
      : super(playerOne, playerTwo, board, winner);
}


enum Play { none, x, y }
