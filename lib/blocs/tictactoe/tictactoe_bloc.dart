import 'package:bloc/bloc.dart';

import 'tictactoe_event.dart';
import 'tictactoe_state.dart';

class TictactoeBloc extends Bloc<TictactoeEvent, TictactoeState> {
  @override
  TictactoeState get initialState =>
      Playing(Play.x, Play.o, TictactoeState.clearBoard(), Play.x);

  @override
  Stream<TictactoeState> mapEventToState(TictactoeEvent event) async* {
    final state = currentState;

    if (state is Playing) {
      switch (event.runtimeType) {
        case DoPlay:
          DoPlay parsedEvent = event;

          List<List<Play>> newBoard = List.from(state.board);

          newBoard[parsedEvent.coordinateX][parsedEvent.coordinateY] =
              state.currentPlayer;

          if (checkForWinner(newBoard, event, state.currentPlayer)) {
            yield HasWinner(state.playerOne, state.playerTwo, newBoard, state.currentPlayer);
            break;
          }

          yield Playing(
            state.playerOne,
            state.playerTwo,
            newBoard,
            state.currentPlayer == Play.o ? Play.x : Play.o,
          );
          break;
        case Reset:
          yield Playing(
            currentState.playerOne,
            currentState.playerTwo,
            TictactoeState.clearBoard(),
            Play.x,
          );
      }
    }
  }

  bool checkForWinner(List<List<Play>> board, DoPlay event, Play play) {
    return checkHorizontal(board, event, play) || checkVertical(board, event, play) || checkDiagonal(board, event, play) || checkAntiDiagonal(board, event, play);
  }

  bool checkHorizontal(List<List<Play>> board, DoPlay event, Play play) {
    for (int i = 0; i < board.length; i++) {
      if (board[event.coordinateX][i] != play) {
        break;
      }

      if (i == board.length - 1) {
        return true;
      }
    }

    return false;
  }

  bool checkVertical(List<List<Play>> board, DoPlay event, Play play) {
    for (int i = 0; i < board.length; i++) {
      if (board[i][event.coordinateY] != play) {
        break;
      }

      if (i == board.length - 1) {
        return true;
      }
    }

    return false;
  }

  bool checkDiagonal(List<List<Play>> board, DoPlay event, Play play) {
    if (event.coordinateX == event.coordinateY) {
      for (int i = 0; i < board.length; i++) {
        if (board[i][i] != play) {
          break;
        }

        if (i == board.length - 1) {
          return true;
        }
      }
    }

    return false;
  }

  bool checkAntiDiagonal(List<List<Play>> board, DoPlay event, Play play) {
    if (event.coordinateX + event.coordinateY == board.length - 1) {
      for (int i = 0; i < board.length; i++) {
        if (board[i][board.length - 1 - i] != play) {
          break;
        }

        if (i == board.length - 1) {
          return true;
        }
      }
    }

    return false;
  }
}
