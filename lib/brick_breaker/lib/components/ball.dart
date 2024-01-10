import 'dart:ui';

import 'package:brick_app/components/bat.dart';
import 'package:brick_app/components/play_area.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

import '../brick_breaker.dart'; // And this import

class Ball extends CircleComponent with CollisionCallbacks ,HasGameReference<BrickBreaker>{
  Ball({
    required this.velocity,
    required super.position,
    required double radius,
  }) : super(
      radius: radius,
      anchor: Anchor.center,
      paint: Paint()
        ..color = const Color(0xff1e6091)
        ..style = PaintingStyle.fill,
      children: [CircleHitbox()]); // Add this parameter


  final Vector2 velocity;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }


  @override                                                     // Add from here...
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayArea) {
      if (intersectionPoints.first.y <= 0) {
        velocity.y = -velocity.y;
      } else if (intersectionPoints.first.x <= 0) {
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.x >= game.width) {
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.y >= game.height) {
        removeFromParent();
      }
    } else if (other is Bat) {
      velocity.y = -velocity.y;
      velocity.x = velocity.x +
          (position.x - other.position.x) / other.size.x * game.width * 0.3;
    }
    else {
      debugPrint('collision with $other');
    }
  }
}
