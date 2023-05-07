import 'package:expenses/data/remote/token_list/token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_token_list_response.g.dart';

@JsonSerializable()
class GetTokenListResponse {

  @JsonKey(name: 'crypto')
  final List<Token>? tokens;

  GetTokenListResponse({required this.tokens});

  factory GetTokenListResponse.fromJson(Map<String, dynamic> json) {
    return _$GetTokenListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTokenListResponseToJson(this);

}