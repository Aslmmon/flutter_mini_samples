import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/game/component/george.dart';
import 'package:untitled/game/component/skeleton.dart';
import 'package:untitled/game/component/zombie.dart';

import 'component/background.dart';
import 'component/player.dart';

void main() async {
  final goldRush = GoldRush();
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();
  runApp(GameWidget(game: goldRush));
}

class GoldRush extends FlameGame with HasCollidables {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    // add(Player());
    add(Background());
    add(George(
        position: Vector2(200, 400), size: Vector2(48.0, 48.0), speed: 40.0));
    add(zombie(
        position: Vector2(100, 200), size: Vector2(32.0, 64.0), speed: 20.0));
    add(zombie(
        position: Vector2(300, 200), size: Vector2(32.0, 64.0), speed: 20.0));

    add(skeleton(
        position: Vector2(100, 600), size: Vector2(32.0, 64.0), speed: 60.0));
    add(skeleton(
        position: Vector2(300, 600), size: Vector2(32.0, 64.0), speed: 60.0));
    add(ScreenCollidable());
  }
}
