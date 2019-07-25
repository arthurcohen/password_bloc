import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:password_bloc/model/player.dart';

@immutable
abstract class TictactoeState extends Equatable {
  final Player playerOne;
  final Player playerTwo;
  static final List<List<int>> board = List<List<int>>.generate(3, (i) => List<int>.generate(3, (j) => -1));

  TictactoeState(this.playerOne, this.playerTwo) : super([playerOne, playerTwo, board]);
}

class HasWinner extends TictactoeState {
  final Player winner;

  HasWinner(playerOne, playerTwo, this.winner) : super(playerOne, playerTwo);

}

class IsDraw extends TictactoeState {
  IsDraw(playerOne, playerTwo, ) : super(playerOne, playerTwo);
}

class Playing extends TictactoeState {
  Playing(playerOne, playerTwo) : super(playerOne, playerTwo);
}

enum Play {
  x, y
}
