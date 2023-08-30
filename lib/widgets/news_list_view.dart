import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile.dart';

import '../models/article_model.dart';
import '../services/news_services.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({
    super.key,
  });

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  List<ArticleModel> articles = [];
  @override
  void initState() {
    //first cycle|step (State)
    //run before build state
    // call once
    // TODO: implement initState
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getNews();
    setState(() {});
  }

  @override
  void dispose() {
    // last cycle|step (State)
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //second cycle|step (State)
    // List<ArticleModel> articles  =await NewsService(Dio()).getNews();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 22.0),
          child: NewsTile(
            articleModel: articles[index],
          ),
        ),
      ),
    );
    // return ListView.builder(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemCount: 10,
    //     itemBuilder: (context, index) {
    //       return const Padding(
    //         padding: EdgeInsets.only(bottom: 22.0),
    //         child: NewsTile(),
    //       );
    //     });
  }
}
