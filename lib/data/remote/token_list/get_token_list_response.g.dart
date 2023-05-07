// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_token_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTokenListResponse _$GetTokenListResponseFromJson(
        Map<String, dynamic> json) =>
    GetTokenListResponse(
      tokens: (json['crypto'] as List<dynamic>?)
          ?.map((e) => Token.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTokenListResponseToJson(
        GetTokenListResponse instance) =>
    <String, dynamic>{
      'crypto': instance.tokens,
    };
