// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      symbol: json['symbol'] as String,
      sysname: json['sysname'] as String,
      name: json['name'] as String,
      marketCapRank: json['marketCapRank'] as int?,
      thumb: json['thumb'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'sysname': instance.sysname,
      'name': instance.name,
      'marketCapRank': instance.marketCapRank,
      'thumb': instance.thumb,
      'large': instance.large,
    };
