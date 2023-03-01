
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/cupertino.dart';

import 'component/player.dart';


void main() async {
  final goldRush = GoldRush();
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortrait();
  runApp(
      GameWidget(game: goldRush)
  );
}

class GoldRush extends FlameGame with HasCollidables{

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(Player());
    add(ScreenCollidable());
  }
  
}


