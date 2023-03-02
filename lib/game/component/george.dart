import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/game/component/character.dart';

late double screenWidth, screenHeight, centerX, centerY;
late double georgeSizeWidth = 48.0, georgeSizeHeight = 48.0;
late SpriteAnimation georgeDownAnimation,
    georgeLeftAnimation,
    georgeUpAnimation,
    georgeRightAnimation;
double elapsedTime = 0.0;
double georgeSpeed = 80.0;
int currentDirection = down;
const int down = 0, left = 1, up = 2, right = 3;

class George extends Character {
  George({required super.position, required super.size, required super.speed});

  @override
  Future<void>? onLoad() async {
    super.onLoad();

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
    changeDirection();
    addHitbox(HitboxRectangle());
  }
}
