import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/game/component/character.dart';
import 'package:untitled/game/component/skeleton.dart';
import 'package:untitled/game/component/zombie.dart';

import 'hud/hud.dart';

late double screenWidth, screenHeight, centerX, centerY;
late double georgeSizeWidth = 48.0, georgeSizeHeight = 48.0;
late SpriteAnimation georgeDownAnimation,
    georgeLeftAnimation,
    georgeUpAnimation,
    georgeRightAnimation;
double elapsedTime = 0.0;
double georgeSpeed = 80.0;
int currentDirection = down;
late double walkingSpeed, runningSpeed;
const int down = 0, left = 1, up = 2, right = 3;

class George extends Character {
  final HudComponent hud;
  George({required this.hud,required super.position, required super.size, required super.speed});

  @override
  Future<void>? onLoad() async {
    super.onLoad();

    walkingSpeed = speed;
    runningSpeed = speed * 2;
    var spriteImages = await Flame.images.load('george.png');
    final spriteSheet = SpriteSheet(
        image: spriteImages,
        srcSize: Vector2(width, height));
    downAnimation =
        spriteSheet.createAnimationByColumn(column: 0, stepTime: 0.2);
    leftAnimation =
        spriteSheet.createAnimationByColumn(column: 1, stepTime: 0.2);
    upAnimation =
        spriteSheet.createAnimationByColumn(column: 2, stepTime: 0.2);
    rightAnimation = spriteSheet.createAnimationByColumn(column: 3, stepTime: 0.2);
   // changeDirection();
    animation = downAnimation;
    playing = false;
    addHitbox(HitboxRectangle());
  }
  @override
  void update(double dt) {
    super.update(dt);
    speed = hud.runButton.buttonPressed ? runningSpeed : walkingSpeed;

    if (!hud.joystick.delta.isZero()) {
      position.add(hud.joystick.relativeDelta * speed * dt);
      playing = true;
      switch (hud.joystick.direction) {
        case JoystickDirection.up:
        case JoystickDirection.upRight:
        case JoystickDirection.upLeft:
          animation = upAnimation;
          currentDirection = Character.up;
          break;
        case JoystickDirection.down:
        case JoystickDirection.downRight:
        case JoystickDirection.downLeft:
          animation = downAnimation;
          currentDirection = Character.down;
          break;
        case JoystickDirection.left:
          animation = leftAnimation;
          currentDirection = Character.left;
          break;
        case JoystickDirection.right:
          animation = rightAnimation;
          currentDirection = Character.right;
          break;
        case JoystickDirection.idle:
          animation = null;
          break; }
    } else {
      if (playing) {
        stopAnimations();
      }
    }

  }
  void stopAnimations() {
    animation?.currentIndex = 0;
    playing = false;
  }
  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (other is zombie || other is skeleton) {
      other.removeFromParent();
      hud.scoreText.setScore(10);
    }
  }
}
