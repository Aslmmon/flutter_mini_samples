import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:untitled/game/component/character.dart';

class zombie extends Character {
  zombie({required super.position, required super.size, required super.speed});

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    var spriteImages = await Flame.images.load('zombie_n_skeleton.png');
    final spriteSheet = SpriteSheet(image: spriteImages, srcSize: size);
    downAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: 0.2, from: 0, to: 2);
    leftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: 0.2, from: 0, to: 2);
    upAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: 0.2, from: 0, to: 2);
    rightAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: 0.2, from: 0, to: 2);
    changeDirection();
    addHitbox(HitboxRectangle());
  }
}
