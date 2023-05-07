// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoResponse _$GetCryptoResponseFromJson(Map<String, dynamic> json) =>
    GetCryptoResponse(
      crypto: (json['crypto'] as List<dynamic>)
          .map((e) => Crypto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCryptoResponseToJson(GetCryptoResponse instance) =>
    <String, dynamic>{
      'crypto': instance.crypto,
    };
