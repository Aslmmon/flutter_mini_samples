

import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:untitled/game/component/skeleton.dart';
import 'package:untitled/game/component/zombie.dart';


class Character extends SpriteAnimationComponent with
    HasHitboxes, Collidable {
  late SpriteAnimation downAnimation, leftAnimation,
      upAnimation, rightAnimation;
  late double speed;
  double elapsedTime = 0.0;
  int currentDirection = down;
  static const int down = 0, left = 1, up = 2, right = 3;


  Character({required Vector2 position,
    required Vector2 size, required double speed}) {
    this.position = position;
    this.size = size;
    this.speed = speed;

  }

  // void changeDirection() {
  //   Random random = Random();
  //   int newDirection = random.nextInt(4);
  //   switch (newDirection) {
  //     case down:
  //       animation = downAnimation;
  //       break;
  //     case left:
  //       animation = leftAnimation;
  //       break;
  //     case up:
  //       animation = upAnimation;
  //       break;
  //     case right:
  //       animation = rightAnimation;
  //       break;
  //   }
  //   currentDirection = newDirection;
  // }
  //
  //
  // @override
  // void update(double dt) {
  //   super.update(dt);
  //   elapsedTime += dt;
  //   if (elapsedTime > 3.0) {
  //     changeDirection();
  //     elapsedTime = 0.0;
  //   }
  //   switch (currentDirection) {
  //     case down:
  //       position.y += speed * dt;
  //       break;
  //     case left:
  //       position.x -= speed * dt;
  //       break;
  //     case up:
  //       position.y -= speed * dt;
  //       break;
  //     case right:
  //       position.x += speed * dt;
  //       break;
  //   }
  // }
  //
  //
  // @override
  // void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
  //   super.onCollision(intersectionPoints, other);
  //   if (other is zombie || other is skeleton) {
  //     other.removeFromParent();
  //   }
  //
  //   if (other is ScreenCollidable) {
  //     switch (currentDirection) {
  //       case down:
  //         currentDirection = up;
  //         animation = upAnimation;
  //         break;
  //       case left:
  //         currentDirection = right;
  //         animation = rightAnimation;
  //         break;
  //       case up:
  //         currentDirection = down;
  //         animation = downAnimation;
  //         break;
  //       case right:
  //         currentDirection = left;
  //         animation = leftAnimation;
  //         break;
  //     }
  //     elapsedTime = 0.0;
  //   }
  // }

}

extension CreateAnimationByColumn on SpriteSheet {
  SpriteAnimation createAnimationByColumn({
    required int column,
    required double stepTime,
    bool loop = true,
    int from = 0,
    int? to,
  }) {
    to ??= columns;
    final spriteList = List<int>.generate(to - from, (i) => from + i)
        .map((e) => getSprite(e, column))
        .toList();
    return SpriteAnimation.spriteList(
      spriteList,
      stepTime: stepTime,
      loop: loop,
    );
  }
}
