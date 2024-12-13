import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:my_flame_game/src/my_game.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Focus(
        onKeyEvent: (node, event) => KeyEventResult.handled,
        child: GameWidget(
          game: MyGame(),
        ),
      ),
    ),
  );
}
