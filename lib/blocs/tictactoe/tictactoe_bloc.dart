import 'package:bloc/bloc.dart';
import 'package:password_bloc/model/player.dart';

import 'tictactoe_event.dart';
import 'tictactoe_state.dart';

class TictactoeBloc extends Bloc<TictactoeEvent, TictactoeState> {
  @override
  TictactoeState get initialState =>
      Playing(Player('1'), Player('2'), TictactoeState.clearBoard(), Play.x);

  @override
  Stream<TictactoeState> mapEventToState(
    TictactoeEvent event,
  ) async* {
    final state = currentState;

    if (state is Playing) {
      switch (event.runtimeType) {
        case DoPlay:
          DoPlay parsedEvent = event;

          List<List<Play>> newBoard = List.from(state.board);

          newBoard[parsedEvent.coordinateX][parsedEvent.coordinateY] =
              state.currentPlayer;

          yield Playing(
            state.playerOne,
            state.playerTwo,
            newBoard,
            state.currentPlayer == Play.y ? Play.x : Play.y,
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
}
