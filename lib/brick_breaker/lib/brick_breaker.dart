
import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'components/ball.dart';
import 'components/play_area.dart';
import 'config.dart';
import 'dart:math' as math; // Add this import


class BrickBreaker extends FlameGame   with HasCollisionDetection {
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


  }
}