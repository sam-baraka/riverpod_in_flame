import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_in_flame/providers/game_state_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<RiverpodAwareGameWidgetState> gameKey =
    GlobalKey<RiverpodAwareGameWidgetState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RiverpodAwareGameWidget(game: MyGame(), key: gameKey),
    );
  }
}

class MyGame extends FlameGame with RiverpodGameMixin {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RiverpodAwareText());
    add(Button(action: () {
      ref.read(gameStateNotifierProvider.notifier).incrementDay();
    })
      ..text = 'OK'
      ..position = Vector2(329, 300));
  }
}

class RiverpodAwareText extends PositionComponent with RiverpodComponentMixin {
  late TextComponent textComponent;

  @override
  void onMount() {
    super.onMount();
    addToGameWidgetBuild(() {
      ref.listen(gameStateNotifierProvider, (prev, next) {
        if (next != null) {
          textComponent.text = next.toString();
        }
      });
    });
    add(textComponent = TextComponent(
      text: ref.watch(gameStateNotifierProvider).toString(),
      position: position + Vector2(0, 200),
    ));
  }
}

class Button extends TextComponent with TapCallbacks, HasGameReference<MyGame> {
  Button({required this.action})
      : super(position: Vector2(10, 10), size: Vector2(10, 10));

  VoidCallback action;

  @override
  void onTapDown(TapDownEvent event) {
    action();
  }
}
