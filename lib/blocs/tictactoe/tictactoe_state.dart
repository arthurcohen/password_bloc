import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:password_bloc/model/player.dart';

@immutable
abstract class TictactoeState extends Equatable {
  final Player playerOne;
  final Player playerTwo;
  final List<List<int>> board;

  TictactoeState(this.playerOne, this.playerTwo, this.board) : super([playerOne, playerTwo, board]);

  static clearBoard() => List<List<int>>.generate(3, (i) => List<int>.generate(3, (j) => -1));
}

class HasWinner extends TictactoeState {
  final Player winner;

  HasWinner(playerOne, playerTwo, this.winner, board) : super(playerOne, playerTwo, board);

}

class IsDraw extends TictactoeState {
  IsDraw(playerOne, playerTwo, board) : super(playerOne, playerTwo, board);
}

class Playing extends TictactoeState {
  Playing(playerOne, playerTwo, board) : super(playerOne, playerTwo, board);
}

enum Play {
  x, y
}
