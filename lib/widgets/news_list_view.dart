import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile.dart';

import '../models/article_model.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key, required this.articles,
  });

  final List<ArticleModel> articles;

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
