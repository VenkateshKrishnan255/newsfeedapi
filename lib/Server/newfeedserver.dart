import 'dart:convert';

import '../Model/newfeeditem.dart';
import 'package:http/http.dart' as http;

class NewFeedServer {

  //Reading From Url
  static Future<NewFeedItem> fetchNewFeed() async {
    final response = await http.get(Uri.parse(
        "https://riad-news-api.vercel.app/api/news/source?code=US-FN"));
    if(response.statusCode == 200){
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return NewFeedItem.fromJson(jsonResponse);
    }else{
      throw Exception("Failed to load Newfeed");
    }
  }

}
