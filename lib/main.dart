import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:my_flame_game/src/my_game.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Focus(
        onKeyEvent: (node, event) => KeyEventResult.handled,
        child: MyGameWidget(),
      ),
    ),
  );
}

class MyGameWidget extends StatefulWidget {
  const MyGameWidget({super.key});

  @override
  State<MyGameWidget> createState() => _MyGameWidgetState();
}

class _MyGameWidgetState extends State<MyGameWidget> {
  final MyGame myGame = MyGame();

  @override
  void reassemble() {
    super.reassemble();
    myGame.reload();
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: myGame,
    );
  }
}
