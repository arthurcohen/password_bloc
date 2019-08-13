import 'package:flutter/material.dart';
import 'package:password_bloc/components/dash-item.dart';

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'for:BLoC',
          style: TextStyle(color: Color(0xffe4dfda)),
        ),
        leading: Icon(
          Icons.menu,
          color: Color(0xffe4dfda),
        ),
        backgroundColor: Color(0xff353531),
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
                  childAspectRatio: 1.5,
                  primary: false,
                  padding: EdgeInsets.all(15),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
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
                    DashItem(
                      title: 'Password',
                      icon: Icons.https,
                      onTap: () =>
                          Navigator.of(context).pushNamed('/password_list'),
                    ),
                    RaisedButton(
                      child: Text(
                        'Counter BLoC',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/counter'),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    DashItem(
                      title: 'Counter',
                      icon: Icons.exposure_plus_1,
                      onTap: () =>
                          Navigator.of(context).pushNamed('/password_list'),
                    ),
                    RaisedButton(
                      child: Text(
                        'Tictactoe BLoC',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      onPressed: () => Navigator.of(context).pushNamed('/ttt'),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    DashItem(
                      title: 'Tic Tac Toe',
                      icon: Icons.grid_on,
                      onTap: () => Navigator.of(context).pushNamed('/ttt'),
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
