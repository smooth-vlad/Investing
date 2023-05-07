import 'package:chopper/chopper.dart';
import 'package:expenses/data/remote/JsonSerializableConverter.dart';
import 'package:expenses/data/remote/auth_interceptor.dart';
import 'package:expenses/data/remote/crypto_service.dart';
import 'package:expenses/data/remote/currency/get_currency_list_response.dart';
import 'package:expenses/data/remote/exchange/get_crypto_price_response.dart';
import 'package:expenses/data/remote/message_response.dart';
import 'package:expenses/data/remote/token_list/get_token_list_response.dart';
import 'package:expenses/data/remote/user/login_response.dart';
import 'package:expenses/data/remote/user_service.dart';
import 'package:flutter/widgets.dart';

import 'crypto/get_crypto_response.dart';

class ExpensesClient extends ChangeNotifier {
  final BuildContext context;
  ChopperClient? _chopper;

  ExpensesClient(this.context) {
    _chopper = ChopperClient(
      baseUrl: Uri.parse("http://192.168.1.169:3000/"),
      services: [CryptoService.create(), UserService.create()],
      converter: JsonSerializableConverter({
        GetCryptoResponse: (json) => GetCryptoResponse.fromJson(json),
        GetTokenListResponse: (json) => GetTokenListResponse.fromJson(json),
        GetCryptoPriceResponse: (json) => GetCryptoPriceResponse.fromJson(json),
        GetCurrencyListResponse: (json) => GetCurrencyListResponse.fromJson(json),
        LoginResponse: (json) => LoginResponse.fromJson(json),
        MessageResponse: (json) => MessageResponse.fromJson(json),
      }),
      interceptors: [
        AuthInterceptor(context),
      ],
    );
  }

  CryptoService getCryptoService() {
    return _chopper!.getService<CryptoService>();
  }

  UserService getUserService() {
    return _chopper!.getService<UserService>();
  }
}
