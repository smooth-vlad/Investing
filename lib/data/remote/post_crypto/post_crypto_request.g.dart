// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_crypto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCryptoRequest _$PostCryptoRequestFromJson(Map<String, dynamic> json) =>
    PostCryptoRequest(
      name: json['name'] as String,
      sysname: json['sysname'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      operationDate: json['operationDate'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$PostCryptoRequestToJson(PostCryptoRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sysname': instance.sysname,
      'amount': instance.amount,
      'currency': instance.currency,
      'operationDate': instance.operationDate,
      'price': instance.price,
    };
