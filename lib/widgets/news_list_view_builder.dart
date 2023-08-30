// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_list_view.dart';

import '../services/news_services.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  // Future<List<ArticleModel>> future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    //second cycle|step (State)
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data ?? [],
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('opps there was an error, try later'),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                ),
                CircularProgressIndicator(),
              ],
            ),
          );
        }
      },
    );
    // return isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             SizedBox(
    //               height: 250,
    //             ),
    //             CircularProgressIndicator(),
    //           ],
    //         ),
    //       )
    //     : articles.isNotEmpty
    //         ? NewsListView(
    //             articles: articles,
    //           )
    //         : const SliverToBoxAdapter(
    //           child: Text('opps there was an error, try later'),
    //         );
  }
}

// bool isLoading = true;
  // @override
  // void initState() {
  //   //first cycle|step (State)
  //   //run before build state
  //   // call once
  //   super.initState();
  //   getGeneralNews();
  // }

  // Future<void> getGeneralNews() async {
  //   articles = await NewsService(Dio()).getNews();
  //   isLoading = false;
  //   setState(() {});
  // }

  // @override
  // void dispose() {
  //   // last cycle|step (State)
  //   super.dispose();
  // }