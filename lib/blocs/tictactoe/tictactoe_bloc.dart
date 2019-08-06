import 'package:bloc/bloc.dart';
import 'package:password_bloc/model/player.dart';

import 'tictactoe_event.dart';
import 'tictactoe_state.dart';

class TictactoeBloc extends Bloc<TictactoeEvent, TictactoeState> {
  @override
  TictactoeState get initialState => Playing(Player('1'), Player('2'), TictactoeState.clearBoard(), Play.x);

  @override
  Stream<TictactoeState> mapEventToState(
    TictactoeEvent event,
  ) async* {
    switch (event.runtimeType) {
      case DoPlay:
        Playing playState = currentState;
        DoPlay parsedEvent = event;

        currentState.board[parsedEvent.coordinateX][parsedEvent.coordinateY] = playState.currentPlayer;
        
        yield Playing(currentState.playerOne, currentState.playerTwo, currentState.board, Play.y);
        break;
      case Reset:
        yield  Playing(currentState.playerOne, currentState.playerTwo, TictactoeState.clearBoard(), Play.x);
    }
  }
}
