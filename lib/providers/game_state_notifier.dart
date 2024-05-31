import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_in_flame/providers/game_state.dart';

final gameStateNotifierProvider =
    StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  return GameStateNotifier(GameState(day: 0, debt: 0, balance: 0));
});

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier(super.state);

  /// This method increments the day by 1.
  /// It is useful when you want to increment the day by 1.
  void incrementDay() {
    state = state.copyWith(day: state.day + 1);
  }

  /// This method increments the debt by 1.
  /// It is useful when you want to increment the debt by 1.
  void incrementDebt() {
    state = state.copyWith(debt: state.debt + 1);
  }

  /// This method increments the balance by 1.
  /// It is useful when you want to increment the balance by 1.
  /// For example, when the player earns money.
  void incrementBalance() {
    state = state.copyWith(balance: state.balance + 1);
  }

  /// This method resets the game state.
  /// It sets the day to 0, the debt to 0, and the balance to 0.
  /// This method is useful when you want to start a new game.
  void reset() {
    state = GameState(day: 0, debt: 0, balance: 0);
  }

  /// This method increments the balance by 10%.
  void incrementBalanceBy10Percent() {
    state = state.copyWith(balance: (state.balance * 1.1).toInt());
  }
}
