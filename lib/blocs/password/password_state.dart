import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PasswordState extends Equatable  {
  final List<String> passwords;

  PasswordState(this.passwords): super([passwords]);
}

class PasswordEmpty extends PasswordState {
  PasswordEmpty() : super(const []);
}

class PasswordLoading extends PasswordState {
  PasswordLoading() : super(const []);
}

class PasswordLoaded extends PasswordState {
  PasswordLoaded({passwords}) : super(passwords);
}

class PasswordNotLoaded extends PasswordState {
  PasswordNotLoaded() : super(const []);
}
