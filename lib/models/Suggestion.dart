part of 'Models.dart';

class Suggestion {
  final String? name;
  final String? suggest;
  Suggestion(this.name, this.suggest);
  Map<String, dynamic> toJson() => {'name': name, 'suggest': suggest};
}

class SuggestionResult {
  final int? code;
  final String? message;
  SuggestionResult({this.code, this.message});

  factory SuggestionResult.fromJson(Map<String, dynamic> object) {
    return SuggestionResult(
        code: object['code'], message: object['message']);
  }
}