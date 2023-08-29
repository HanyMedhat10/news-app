import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  // final dio =  Dio();
  final Dio dio;
  final String apiKey = '9cdd34ed241641fe8a429bec1adc5b85';
  final String baseApi = 'https://newsapi.org/v2/everything?';
  final String path =
      'https://newsapi.org/v2/everything?country=us&apiKey=9cdd34ed241641fe8a429bec1adc5b85&category=general';
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews() async {
    Response response = await dio.get(path);
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articleList = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
        image: article['urlToImage'],
        title: article['title'],
        subTitle: article['description'],
      );
      articleList.add(articleModel);
    }
    return articleList;
  }
}
