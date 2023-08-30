import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  // final dio =  Dio();
  final Dio dio;
  final String apiKey = '9cdd34ed241641fe8a429bec1adc5b85';
  final String baseApi = 'https://newsapi.org/v2/top-headlines?country=us';

  NewsService(this.dio);
  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    String path = '$baseApi&apiKey=$apiKey&category=$category';
    try {
      Response response = await dio.get(path);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];
      for (var article in articles) {
        if (article['source']['name'] != null) {
          ArticleModel articleModel = ArticleModel(
            image: article['urlToImage'],
            title: article['title'],
            subTitle: article['description'],
            url: article['url'],
          );
          articleList.add(articleModel);
        }
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
