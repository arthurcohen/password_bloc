import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'tictactoe_state.dart';

@immutable
abstract class TictactoeEvent extends Equatable {
  TictactoeEvent([List props = const []]): super(props);
}

class DoPlay extends TictactoeEvent {
  final int coordinateX;
  final int coordinateY;
  final Play play;

  DoPlay(this.coordinateX, this.coordinateY, this.play):super([coordinateX, coordinateY, play]);

}

class Reset extends TictactoeEvent {
  Reset():super([]);
}

