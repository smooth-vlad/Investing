import 'package:expenses/ui/price_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formatPrice with four decimal places', () {
    expect(PriceFormatter.formatPrice(234.5678), '234.568');
  });

  test('formatPrice with a space as thousands separator', () {
    expect(PriceFormatter.formatPrice(1234.5), '1 234.50');
  });

  test('formatPrice with six decimal places', () {
    expect(PriceFormatter.formatPrice(0.123456), '0.123456');
  });

  test('formatPrice with six decimal places and leading zeroes', () {
    expect(PriceFormatter.formatPrice(0.000123), '0.000123');
  });

  test('formatPrice with nine decimal places and rounding', () {
    expect(PriceFormatter.formatPrice(0.00001123123), '0.0000112312');
  });

  test('formatPrice with two decimal places', () {
    expect(PriceFormatter.formatPrice(0.01), '0.01');
  });

  test('formatPrice with large number and space as thousands separator', () {
    expect(PriceFormatter.formatPrice(1000000.0), '1 000 000.00');
  });

  test('formatPrice with space as thousands separator and rounding', () {
    expect(PriceFormatter.formatPrice(12345.678901), '12 345.68');
  });

  test('formatPrice with custom nonZeroDigitsInString', () {
    expect(PriceFormatter.formatPrice(234.5678, nonZeroDigits: 4), '234.57');
  });

  test('formatPrice with custom nonZeroDigitsInString and large number', () {
    expect(PriceFormatter.formatPrice(12345.678901, nonZeroDigits: 4), '12 345.68');
  });

  test('formatPrice with custom nonZeroDigitsInString and leading zeroes', () {
    expect(PriceFormatter.formatPrice(0.000123456789, nonZeroDigits: 4), '0.0001235');
  });

  test('formatPrice with custom nonZeroDigitsInString and nine decimal places', () {
    expect(PriceFormatter.formatPrice(0.00001123123, nonZeroDigits: 4), '0.00001123');
  });
}
