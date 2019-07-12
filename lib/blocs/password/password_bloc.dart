

import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:password_bloc/blocs/password/password_event.dart';
import 'package:password_bloc/blocs/password/password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  @override
  PasswordState get initialState => PasswordNotLoaded();

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    switch (event.runtimeType) {
      case LoadPasswords:
        yield PasswordLoading();

        final response = await http.get('https://www.passwordrandom.com/query?command=guid&format=json&count=20');

        if (response.statusCode == 200) {
          List<String> passwords = json.decode(response.body)['char'].cast<String>();
          yield PasswordLoaded(passwords: passwords);
        } else {
          yield PasswordEmpty();
        }
        break;

      case RemovePassword:
        yield PasswordEmpty();
    }
  }
  
}
