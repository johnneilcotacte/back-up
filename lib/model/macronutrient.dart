class MacroNutrient {
  String? _carbs;
  String? _fats;
  String? _cal;

  MacroNutrient({
    String? carbs,
    String? fats,
    String? cal,
  })  : _carbs = carbs,
        _fats = fats,
        _cal = cal;

  factory MacroNutrient.fromJson(Map<String, dynamic> json) {
    return MacroNutrient(
      carbs: json['carbs'] as String? ?? '',
      fats: json['fats'] as String? ?? '',
      cal: json['cal'] as String? ?? '',
    );
  }

  String? get carbs => _carbs;
  String? get fats => _fats;
  String? get cal => _cal;

  Map<String, dynamic> nutrients() {
    return {
      "carbs": "$carbs",
      "fats": "$fats",
      "cal": "$cal",
    };
  }
}
