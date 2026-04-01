double parsePriceTextToDouble(String? priceText) {
  if (priceText == null || priceText.trim().isEmpty) {
    return 0;
  }

  final String normalized = priceText.replaceAll(RegExp(r'[^0-9.]'), '');
  return double.tryParse(normalized) ?? 0;
}
