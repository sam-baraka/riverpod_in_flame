class GameState {
  final int day;
  final int debt;
  final int balance;

  GameState({required this.day, required this.debt, required this.balance});

  GameState copyWith({int? day, int? debt, int? balance}) {
    return GameState(
      day: day ?? this.day,
      debt: debt ?? this.debt,
      balance: balance ?? this.balance,
    );
  }

  @override
  String toString() {
    return 'GameState{day: $day, debt: $debt, balance: $balance}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameState &&
        other.day == day &&
        other.debt == debt &&
        other.balance == balance;
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'debt': debt,
      'balance': balance,
    };
  }

  GameState.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        debt = json['debt'],
        balance = json['balance'];
}
