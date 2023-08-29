import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  // final dio =  Dio();
  final Dio dio;
  final String apiKey = '9cdd34ed241641fe8a429bec1adc5b85';
  final String baseApi = 'https://newsapi.org/v2/everything?';
  final String path =
      'https://newsapi.org/v2/everything?country=eg&apiKey=9cdd34ed241641fe8a429bec1adc5b85&category=general';
  NewsService(this.dio);

  void getNews() async {
    Response response = await dio.get(path);
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
   
  }
}
