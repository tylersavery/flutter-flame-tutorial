import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:my_flame_game/src/my_game.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}
