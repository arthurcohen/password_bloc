import 'package:equatable/equatable.dart';

class Player extends Equatable {
  String name;

  Player(this.name):super([name]);

  @override
  String toString() => this.name;
}
