
import 'dart:async';
import 'dart:ui';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'components/ball.dart';
import 'components/bat.dart';
import 'components/play_area.dart';
import 'config.dart';
import 'dart:math' as math; // Add this import
import 'package:flutter/material.dart';                         // And this import
import 'package:flutter/services.dart';
import 'package:flame/events.dart';                             // Add this import

class BrickBreaker extends FlameGame   with HasCollisionDetection,KeyboardEvents {
  BrickBreaker() : super(
    camera: CameraComponent.withFixedResolution(
      width: gameWidth,
      height: gameHeight,
    ),
  );

  final rand = math.Random();                                   // Add this variable

  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;
    world.add(PlayArea());

    world.add(Ball(
        radius: ballRadius,
        position: size / 2,
        velocity: Vector2((rand.nextDouble() - 0.5) * width, height * 0.2).normalized()..scale(height / 4)));
    debugMode = true;                                           // To here.


    world.add(Bat(                                              // Add from here...
        size: Vector2(batWidth, batHeight),
        cornerRadius: const Radius.circular(ballRadius / 2),
        position: Vector2(width / 2, height * 0.95)));          // To here


  }

  @override                                                     // Add from here...
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);
    if(event.logicalKey == LogicalKeyboardKey.arrowLeft){
      world.children.query<Bat>().first.moveBy(-batStep);

    }else if(event.logicalKey == LogicalKeyboardKey.arrowRight){
      world.children.query<Bat>().first.moveBy(batStep);
    }
    return KeyEventResult.handled;
  }
}