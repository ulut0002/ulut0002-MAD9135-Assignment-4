import "package:flutter2/models/app_model.dart";
import "package:http/http.dart" as http;
import "dart:convert"; //for JSON conversion
import "dart:async"; //for Futures (Promises)

class HTTPHelper {
  static Future<List<News>> fetch(String url) async {
    Uri uri = Uri.parse(url);
    http.Response resp = await http.get(uri);
    if (resp.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(resp.body);
      List<dynamic> articles = data["articles"];
      return articles.map((news) {
        return News.fromJson(news);
      }).toList();
    } else {
      throw Exception('Did not get a valid response.');
    }
  }
}
