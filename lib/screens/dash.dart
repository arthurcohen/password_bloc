import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('for:BLoC'),
        leading: Icon(Icons.menu),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'A pratical app with some pratical examples of BLoC Pattern.',
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.all(15),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        'Password BLoC',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/password_list'),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    RaisedButton(
                      child: Text(
                        'Counter BLoC',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      onPressed: () => Navigator.of(context).pushNamed('/counter'),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    RaisedButton(
                      child: Text(
                        'Tictactoe BLoC',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      color: Theme.of(context).primaryColorLight,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
