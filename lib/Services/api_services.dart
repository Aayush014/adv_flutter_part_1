import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/news_model.dart';

class ApiService {
  final String apiUrl = 'https://newsapi.org/v2/top-headlines/sources?apiKey=7f207a9a57ca49b3952ffe61eda548d7';

  Future<News?> fetchNewsSources() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return News.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to load news sources');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
