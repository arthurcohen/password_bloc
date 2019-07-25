import 'package:bloc/bloc.dart';
import 'package:password_bloc/model/player.dart';

import 'tictactoe_event.dart';
import 'tictactoe_state.dart';

class TictactoeBloc extends Bloc<TictactoeEvent, TictactoeState> {
  @override
  TictactoeState get initialState => Playing(Player('1'), Player('2'));

  @override
  Stream<TictactoeState> mapEventToState(
    TictactoeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
