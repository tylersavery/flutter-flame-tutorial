import 'dart:async';

import 'package:flame/components.dart';
import 'package:my_flame_game/src/my_game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World with HasGameRef<MyGame> {
  final String levelName;

  Level({required this.levelName});

  late TiledComponent map;

  @override
  FutureOr<void> onLoad() async {
    map = await TiledComponent.load("$levelName.tmx", Vector2.all(16));

    add(map);

    return super.onLoad();
  }
}
