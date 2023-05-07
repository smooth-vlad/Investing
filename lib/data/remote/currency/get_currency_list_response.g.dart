// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currency_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrencyListResponse _$GetCurrencyListResponseFromJson(
        Map<String, dynamic> json) =>
    GetCurrencyListResponse(
      currencies: (json['currency'] as List<dynamic>?)
          ?.map((e) => Currency.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCurrencyListResponseToJson(
        GetCurrencyListResponse instance) =>
    <String, dynamic>{
      'currency': instance.currencies,
    };
