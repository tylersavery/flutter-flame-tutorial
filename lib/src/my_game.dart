import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:my_flame_game/src/level.dart';
import 'package:my_flame_game/src/player.dart';

class MyGame extends FlameGame {
  MyGame();

  late Level level;
  late CameraComponent cam;
  late Player player;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();
    player = Player();

    _loadLevel("level1");

    return super.onLoad();
  }

  void _loadLevel(String levelName) {
    level = Level(levelName: levelName, player: player);

    final windowWidth = size.x;
    final windowHeight = size.y;

    cam = CameraComponent(
      world: level,
      viewport: FixedSizeViewport(
        windowWidth,
        windowHeight,
      ),
    );

    cam.viewfinder.anchor = Anchor.center;
    cam.viewfinder.zoom = 2.0;

    final x = (size.x - windowWidth) / 2;
    final y = (size.y - windowHeight) / 2;
    cam.viewport.position = Vector2(x, y);

    cam.follow(player);

    addAll([cam, level]);
  }
}
