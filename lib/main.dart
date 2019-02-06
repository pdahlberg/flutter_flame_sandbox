import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show Colors, TextPainter, runApp;
import 'package:flutter/widgets.dart';

var points = 0;

main() async {
  Flame.audio.disableLog();

  var game = new MyGame();

  runApp(MyApp(game));
}

class MyApp extends StatelessWidget {

  MyGame game;

  MyApp(this.game);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        game.input(details.globalPosition.dx, details.globalPosition.dy);
      },
      child: Center(
        child: Container(
          color: Colors.black,
          child: game.widget
        ),
      )
    );
  }
}

class MyGame extends BaseGame {

  Crate crate1;
  Crate crate2;

  MyGame() {
    this.crate1 = Crate();
    this.crate1.x = 100.0;
    this.crate1.y = 100.0;

    this.crate2 = Crate();
    this.crate2.x = 200.0;
    this.crate2.y = 100.0;
  }

  @override
  void render(Canvas canvas) {
    this.crate1.render(canvas);
    this.crate2.render(canvas);
  }

  @override
  void update(double t) {
    crate1.y += 5 * t;
  }

  void input(double x, double y) {
    crate1.y -= 10;
  }

}

class Crate extends SpriteComponent {
  Crate() : super.square(128.0, 'git.png') {
    this.angle = 0.0;
  }
}
