// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crypto _$CryptoFromJson(Map<String, dynamic> json) => Crypto(
      id: json['_id'] as String,
      name: json['name'] as String,
      sysname: json['sysname'] as String,
      price: (json['price'] as num).toDouble(),
      pricePerItem: (json['pricePerItem'] as num).toDouble(),
      amount: json['amount'] as num,
      type: CryptoType.fromJson(json['type'] as Map<String, dynamic>),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      crypto: json['crypto'] == null
          ? null
          : Token.fromJson(json['crypto'] as Map<String, dynamic>),
      userProfileId: json['userProfileId'] as String,
      allTime: (json['allTime'] as num).toDouble(),
      allTimePercent: (json['allTimePercent'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      priceIntraday: (json['priceIntraday'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoToJson(Crypto instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'sysname': instance.sysname,
      'price': instance.price,
      'pricePerItem': instance.pricePerItem,
      'amount': instance.amount,
      'type': instance.type,
      'currency': instance.currency,
      'crypto': instance.crypto,
      'userProfileId': instance.userProfileId,
      'allTime': instance.allTime,
      'allTimePercent': instance.allTimePercent,
      'currentPrice': instance.currentPrice,
      'priceIntraday': instance.priceIntraday,
    };
