part of 'Services.dart';

class SuggestionServices {
  final int? statusCode;
  final String? message;
  SuggestionServices({this.statusCode, this.message});

  factory SuggestionServices.fromJson(Map<String, dynamic> object) {
    return SuggestionServices(
        statusCode: object['code'], message: object['message']);
  }

  static Future<SuggestionResult> postSuggestion(String name, String suggest) async {
    String url = serviceUrl + "Froti/Api/api_post.php";
    Suggestion suggestion = new Suggestion(name, suggest);
    final result = await http.post(Uri.parse(url), body: jsonEncode(suggestion.toJson()));
    if (result.statusCode == 200) {
      var resultBody = SuggestionResult.fromJson(jsonDecode(result.body));
      return SuggestionResult( code: resultBody.code, message: resultBody.message );
    } else {
      throw Exception('throw err');
    }
  }
}
