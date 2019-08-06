import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TictactoeEvent extends Equatable {
  TictactoeEvent([List props = const []]): super(props);
}

class DoPlay extends TictactoeEvent {
  final int coordinateX;
  final int coordinateY;

  DoPlay(this.coordinateX, this.coordinateY):super([coordinateX, coordinateY]);
}

class Reset extends TictactoeEvent {
  Reset():super([]);
}

