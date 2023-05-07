// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: json['_id'] as String,
      name: json['name'] as String?,
      sysname: json['sysname'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'sysname': instance.sysname,
      'symbol': instance.symbol,
    };
