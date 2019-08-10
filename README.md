# Password BLoC

BLoC study!

Everything started as a simple study with Flutter, trying to learn some more about the framework and this awesome state management pattern called BLoC.

My experience was so good that I decided to make a bigger projetc, with vary examples how to use BLoC, when to use, best practices, and more.

## Getting Started

For now, the project has three examples: 
- The [PasswordBloc](lib/blocs/password/password_bloc.dart). There, I use the http library to fetch some data from [passwordrandom.com](https://www.passwordrandom.com), and list the content dinamicly on the screen;
- The [CounterBloc](lib/blocs/counter/counter_bloc.dart). Here, I've done a simple, but not so familiar counter app. Using BLoC and StatefullWidgets, you can increment and decrement values in the screen.
- The [TicTacToeBloc](lib/blocs/tictactoe/tictactoe_bloc.dart). Now, every logic of the game is inside the BLoC. This is a simple game with simple rules, for playing locally with a friend. Maybe in the future I develop an online version, as in [Chaos Cards](https://github.com/arthurcohen/ChaosCards).

## Running

Running the app is very simple, you just need to clone this repo, download the dependencies (flutter packages get), and run the project (flutter run)

## Built with

* [Flutter](https://github.com/flutter/flutter) - Google's mobile app SDK for crafting high-quality native interfaces

## Author

* [Arthur Cohen](www.forcohen.com)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
