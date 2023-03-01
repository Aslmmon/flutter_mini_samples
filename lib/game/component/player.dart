import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent with HasHitboxes,Collidable{
  static const int squareSpeed = 250;

  static final squarePaint = BasicPalette.blue.paint();
  static const squareWidth = 100.0, squareHeight = 100.0;
  //late Rect squarePos;
  int squareDirection = 1;
  late double screenWidth, screenHeight, centerX,
      centerY;
  @override
  void update(double dt) {
    super.update(dt);
    position.x +=squareSpeed * squareDirection * dt;
    // squarePos = squarePos.translate((squareSpeed.toDouble() * squareDirection.toDouble()) * dt, 0);
    // if (squareDirection == 1 && squarePos.right > screenWidth) {
    //   squareDirection = -1;
    //
    //
    // } else if (squareDirection == -1 && squarePos.left < 0) {
    //   squareDirection = 1;
    // }
  }


  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is ScreenCollidable) {
      if (squareDirection == 1) {
        squareDirection = -1;
      } else {
        squareDirection = 1;
      } }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  //  canvas.drawRect(squarePos, squarePaint);
    renderHitboxes(canvas, paint: squarePaint);
  }



  @override
  Future<void>? onLoad() async {
    super.onLoad();
    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight =
        MediaQueryData.fromWindow(window).size.height;
    centerX = (screenWidth / 2) - (squareWidth / 2);
    centerY = (screenHeight / 2) - (squareHeight / 2);
  //  squarePos = Rect.fromLTWH(centerX, centerY, squareWidth, squareHeight);
    position = Vector2(centerX, centerY);
    size = Vector2(squareWidth, squareHeight);
    addHitbox(HitboxRectangle());
  }

}