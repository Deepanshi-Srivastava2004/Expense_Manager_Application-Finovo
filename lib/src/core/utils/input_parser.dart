class InputParser {
  static Map<String, dynamic> parse(String input) {
    final parts = input.trim().split(' ');

    double amount = 0;
    String note = '';

    for (var part in parts) {
      if (double.tryParse(part) != null) {
        amount = double.parse(part);
      } else {
        note += "$part ";
      }
    }

    return {
      'amount': amount,
      'note': note.trim(),
    };
  }
}