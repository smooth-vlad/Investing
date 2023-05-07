import 'package:json_annotation/json_annotation.dart';

part 'search_token_list_request.g.dart';

@JsonSerializable()
class SearchCryptoRequest {
  final String query;

  SearchCryptoRequest({required this.query});

  factory SearchCryptoRequest.fromJson(Map<String, dynamic> json) {
    return SearchCryptoRequest(
      query: json['query'],
    );
  }

  Map<String, dynamic> toJson() => _$SearchCryptoRequestToJson(this);
}