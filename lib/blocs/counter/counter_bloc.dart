import 'counter_event.dart';
import 'package:bloc/bloc.dart';

import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState(0);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event.runtimeType) {
      case Increment:
        yield CounterState(currentState.value + 1);
        break;
      case Decrement:
        yield CounterState(currentState.value - 1);
        break;

    }
  }
}
