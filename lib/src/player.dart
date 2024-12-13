import 'dart:async';

import 'package:flame/components.dart';
import 'package:my_flame_game/src/my_game.dart';

enum PlayerState {
  walkUp("character-up", 4),
  walkDown("character-down", 4),
  walkRight("character-right", 4),
  walkLeft("character-left", 4),
  ;

  final String assetName;
  final int frameCount;
  const PlayerState(this.assetName, this.frameCount);
}

class Player extends SpriteAnimationGroupComponent with HasGameRef<MyGame> {
  Player({super.position});

  late final Vector2 startingPosition;

  late final SpriteAnimation walkUpAnimation;
  late final SpriteAnimation walkDownAnimation;
  late final SpriteAnimation walkRightAnimation;
  late final SpriteAnimation walkLeftAnimation;

  @override
  FutureOr<void> onLoad() {
    startingPosition = position;

    _loadAllAnimations();

    return super.onLoad();
  }

  void _loadAllAnimations() {
    walkUpAnimation = _spriteAnimation(PlayerState.walkUp);
    walkDownAnimation = _spriteAnimation(PlayerState.walkDown);
    walkLeftAnimation = _spriteAnimation(PlayerState.walkLeft);
    walkRightAnimation = _spriteAnimation(PlayerState.walkRight);

    animations = {
      PlayerState.walkUp: walkUpAnimation,
      PlayerState.walkDown: walkDownAnimation,
      PlayerState.walkLeft: walkLeftAnimation,
      PlayerState.walkRight: walkRightAnimation,
    };

    current = PlayerState.walkDown;
  }

  SpriteAnimation _spriteAnimation(PlayerState state) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache("characters/${state.assetName}.png"),
      SpriteAnimationData.sequenced(
        amount: state.frameCount,
        stepTime: 0.1,
        textureSize: Vector2.all(48),
      ),
    );
  }
}
