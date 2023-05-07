// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CryptoService extends CryptoService {
  _$CryptoService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CryptoService;

  @override
  Future<Response<GetCryptoResponse>> getCrypto() {
    final Uri $url = Uri.parse('/api/crypto');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<GetCryptoResponse, GetCryptoResponse>($request);
  }

  @override
  Future<Response<GetTokenListResponse>> getTokens() {
    final Uri $url = Uri.parse('/api/crypto/list');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<GetTokenListResponse, GetTokenListResponse>($request);
  }

  @override
  Future<Response<GetCurrencyListResponse>> getCurrencies() {
    final Uri $url = Uri.parse('/api/currency/list');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client
        .send<GetCurrencyListResponse, GetCurrencyListResponse>($request);
  }

  @override
  Future<Response<GetCryptoPriceResponse>> getCryptoPriceByDate(
      GetCryptoPriceRequest body) {
    final Uri $url = Uri.parse('/api/getCryptoPriceByDate');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<GetCryptoPriceResponse, GetCryptoPriceResponse>($request);
  }

  @override
  Future<Response<GetTokenListResponse>> searchTokens(
      SearchCryptoRequest body) {
    final Uri $url = Uri.parse('/api/crypto/search');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<GetTokenListResponse, GetTokenListResponse>($request);
  }

  @override
  Future<Response<Object>> postCrypto(PostCryptoRequest body) {
    final Uri $url = Uri.parse('/api/crypto');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<Object>> deleteCrypto(DeleteCryptoRequest body) {
    final Uri $url = Uri.parse('/api/crypto/delete');
    final $body = body;
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Object, Object>($request);
  }
}
