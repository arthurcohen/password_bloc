import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_bloc/blocs/password/password_bloc.dart';
import 'package:password_bloc/blocs/password/password_event.dart';
import 'package:password_bloc/blocs/password/password_state.dart';

class PasswordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PasswordBloc passBloc = BlocProvider.of<PasswordBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Password Bloc'),
      ),
      body: BlocBuilder(
        bloc: passBloc,
        builder: (context, PasswordState state) {
          List<String> passwords = state.passwords;
          print('build');

          Widget child;

          switch (state.runtimeType) {
            case PasswordLoading:
              child = Center(
                child: CircularProgressIndicator(),
              );
              break;
            case PasswordLoaded:
              child = ListView.builder(
                itemCount: passwords.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(
                    passwords[index],
                  ),
                  onTap: () {
                    passBloc.dispatch(RemovePassword());
                  },
                ),
              );
              break;
            default:
              child = ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(
                      'Não há senhas disponíveis. Arraste para baixo para carregar a lista.'),
                ),
              );
          }
          return RefreshIndicator(
            child: child,
            onRefresh: () {
              passBloc.dispatch(LoadPasswords());

              return Future.delayed(Duration(milliseconds: 100));
            },
          );
        },
      ),
    );
  }
}
