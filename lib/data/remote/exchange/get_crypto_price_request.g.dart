// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_price_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoPriceRequest _$GetCryptoPriceRequestFromJson(
        Map<String, dynamic> json) =>
    GetCryptoPriceRequest(
      operationDate: json['operationDate'] as int,
      tokenId: json['sysname'] as String,
      currencyId: json['currency'] as String,
    );

Map<String, dynamic> _$GetCryptoPriceRequestToJson(
        GetCryptoPriceRequest instance) =>
    <String, dynamic>{
      'operationDate': instance.operationDate,
      'sysname': instance.tokenId,
      'currency': instance.currencyId,
    };
