import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:my_flame_game/src/level.dart';

class MyGame extends FlameGame {
  MyGame();

  late SpriteSheet grassSpriteSheet;
  late Level level;
  late CameraComponent cam;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    grassSpriteSheet = SpriteSheet(
      image: await images.load("Grass.png"),
      srcSize: Vector2.all(16),
    );

    _loadLevel("level1");

    return super.onLoad();
  }

  void _loadLevel(String levelName) {
    level = Level(levelName: levelName);

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

    addAll([cam, level]);
  }
}
