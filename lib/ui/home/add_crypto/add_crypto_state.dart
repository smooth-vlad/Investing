import 'package:expenses/data/remote/crypto/crypto.dart';
import 'package:expenses/data/remote/currency/currency.dart';
import 'package:expenses/data/remote/token_list/token.dart';
import 'package:flutter/widgets.dart';

enum Operation { BUY, SELL }

class AddCryptoState extends ChangeNotifier {
  Token? _selectedToken;

  Token? get selectedToken => _selectedToken;

  void updateSelectedToken(Token token) {
    _selectedToken = token;
    notifyListeners();
  }

  Currency? _selectedCurrency;

  Currency? get selectedCurrency => _selectedCurrency;

  void updateSelectedCurrency(Currency currency) {
    _selectedCurrency = currency;
    notifyListeners();
  }

  Operation _operationType = Operation.BUY;

  Operation get operationType => _operationType;

  void updateOperationType(Operation operation) {
    _operationType = operation;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  final TextEditingController _priceTextController =
  TextEditingController(text: "0");

  TextEditingController get priceTextController => _priceTextController;



  final TextEditingController _quantityTextController =
  TextEditingController(text: "1");

  TextEditingController get quantityTextController => _quantityTextController;

}
