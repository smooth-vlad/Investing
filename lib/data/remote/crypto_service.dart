import 'package:chopper/chopper.dart';
import 'package:expenses/data/remote/crypto/delete/delete_crypto_request.dart';
import 'package:expenses/data/remote/crypto/get_crypto_response.dart';
import 'package:expenses/data/remote/currency/get_currency_list_response.dart';
import 'package:expenses/data/remote/exchange/get_crypto_price_request.dart';
import 'package:expenses/data/remote/exchange/get_crypto_price_response.dart';
import 'package:expenses/data/remote/post_crypto/post_crypto_request.dart';
import 'package:expenses/data/remote/token_list/get_token_list_response.dart';
import 'package:expenses/data/remote/token_list_search/search_token_list_request.dart';

part 'crypto_service.chopper.dart';

@ChopperApi(baseUrl: '/api/')
abstract class CryptoService extends ChopperService {
  @Get(path: "crypto")
  Future<Response<GetCryptoResponse>> getCrypto();

  @Post(path: "crypto/list")
  Future<Response<GetTokenListResponse>> getTokens();

  @Post(path: "currency/list")
  Future<Response<GetCurrencyListResponse>> getCurrencies();

  @Post(path: "getCryptoPriceByDate")
  Future<Response<GetCryptoPriceResponse>> getCryptoPriceByDate(
      @Body() GetCryptoPriceRequest body);

  @Post(path: "crypto/search")
  Future<Response<GetTokenListResponse>> searchTokens(
      @Body() SearchCryptoRequest body);

  @Post(path: "crypto")
  Future<Response<Object>> postCrypto(@Body() PostCryptoRequest body);

  @Delete(path: "crypto/delete")
  Future<Response<Object>> deleteCrypto(@Body() DeleteCryptoRequest body);

  static CryptoService create([ChopperClient? client]) =>
      _$CryptoService(client);
}
