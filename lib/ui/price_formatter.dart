class PriceFormatter {
  static String formatPrice(double price, {int nonZeroDigits = 6}) {
    if (price == 0) {
      return '0.00';
    }

    int intPart = price.toInt();
    double decimalPart = (price - intPart);

    if (price >= 1000) {
      String formattedBeforeDot = _formatNumberBeforeDot(intPart.toString());
      String formattedAfterDot =
      decimalPart.toStringAsFixed(2).substring(1);
      return '$formattedBeforeDot$formattedAfterDot';
    } else if (price >= 1) {
      String formattedBeforeDot = intPart.toString();

      int digitsInIntPart = 0;
      if (intPart > 0) {
        digitsInIntPart = intPart.toString().length;
      }

      int digitsInDecimalPart = nonZeroDigits - digitsInIntPart;
      if (digitsInDecimalPart < 2) {
        digitsInDecimalPart = 2;
      }

      String formattedAfterDot =
      decimalPart.toStringAsFixed(digitsInDecimalPart).substring(1);
      return '$formattedBeforeDot$formattedAfterDot';
    } else {
      int firstNonZeroDigit = _firstNonZeroDigitIndex(price.toString());
      int lastNonZeroDigit = _lastNonZeroDigitIndex(price.toString());
      int digitsAfterDot = lastNonZeroDigit - firstNonZeroDigit + 1;
      if (digitsAfterDot > nonZeroDigits) {
        digitsAfterDot = nonZeroDigits;
      }
      digitsAfterDot += firstNonZeroDigit - 2;

      String formattedAfterDot =
      price.toStringAsFixed(digitsAfterDot);
      return formattedAfterDot;
    }
  }

  static int _firstNonZeroDigitIndex(String num) {
    int firstNonZeroDigitIndex = 0;
    for (int i = 0; i < num.length; i++) {
      if (num[i] != '0' && num[i] != '.') {
        firstNonZeroDigitIndex = i;
        break;
      }
    }
    return firstNonZeroDigitIndex;
  }

  static int _lastNonZeroDigitIndex(String num) {
    int lastNonZeroDigitIndex = num.length;
    for (int i = num.length - 1; i >= _firstNonZeroDigitIndex(num); i--) {
      if (num[i] != '0' && num[i] != '.') {
        lastNonZeroDigitIndex = i;
        break;
      }
    }
    return lastNonZeroDigitIndex;
  }

  static String _formatNumberBeforeDot(String num) {
    List<String> chars = num.split('').reversed.toList();
    List<String> formattedChars = [];

    for (int i = 0; i < chars.length; i++) {
      if (i > 0 && i % 3 == 0) {
        formattedChars.add(' ');
      }
      formattedChars.add(chars[i]);
    }

    return formattedChars.reversed.join('');
  }
}