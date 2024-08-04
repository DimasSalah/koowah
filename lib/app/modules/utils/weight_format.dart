String formatWeight(int weight) {
  if (weight < 1000) {
    return '$weight gram';
  } else if (weight < 1000000) {
    double kg = weight / 1000;
    if (kg == kg.toInt()) {
      return '${kg.toInt()} kg';
    } else {
      return '${kg.toStringAsFixed(2)} kg';
    }
  } else if (weight < 1000000000) {
    double tonne = weight / 1000000;
    if (tonne == tonne.toInt()) {
      return '${tonne.toInt()} ton';
    } else {
      return '${tonne.toStringAsFixed(2)} ton';
    }
  } else {
    double kiloTonne = weight / 1000000000;
    if (kiloTonne == kiloTonne.toInt()) {
      return '${kiloTonne.toInt()} kilotonne';
    } else {
      return '${kiloTonne.toStringAsFixed(2)} kilotonne';
    }
  }
}
