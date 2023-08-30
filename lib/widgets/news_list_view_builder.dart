import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view.dart';

import '../models/article_model.dart';
import '../services/news_services.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  @override
  void initState() {
    //first cycle|step (State)
    //run before build state
    // call once
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getNews();
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    // last cycle|step (State)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //second cycle|step (State)
    return isLoading
        ? const SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                ),
                CircularProgressIndicator(),
              ],
            ),
          )
        : articles.isNotEmpty
            ? NewsListView(
                articles: articles,
              )
            : const SliverToBoxAdapter(
              child: Text('opps there was an error, try later'),
            );
  }
}
