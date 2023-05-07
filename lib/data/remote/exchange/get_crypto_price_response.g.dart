// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoPriceResponse _$GetCryptoPriceResponseFromJson(
        Map<String, dynamic> json) =>
    GetCryptoPriceResponse(
      price: (json['crypto'] as num).toDouble(),
    );

Map<String, dynamic> _$GetCryptoPriceResponseToJson(
        GetCryptoPriceResponse instance) =>
    <String, dynamic>{
      'crypto': instance.price,
    };
