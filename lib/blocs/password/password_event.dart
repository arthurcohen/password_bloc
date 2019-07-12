import 'package:meta/meta.dart';

@immutable
abstract class PasswordEvent {}

class LoadPasswords extends PasswordEvent {}

class FavoritePassword extends PasswordEvent {}

class UnfavoritePassword extends PasswordEvent {}

class RemovePassword extends PasswordEvent {}

class ClearPasswords extends PasswordEvent {}
