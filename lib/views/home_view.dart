import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_list_view.dart';

import '../widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        // child: Column(
        //   children: [
        //     CategoryListView(),
        //     SizedBox(
        //       height: 32,
        //     ),
        //     Expanded(child: NewsListView()),
        //   ],
        // ),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            ),
            NewsListViewBuilder(
              category: 'general',
            ),
            // const SliverToBoxAdapter(
            //   child: NewsListView(),
            // ),
          ],
        ),
      ),
    );
  }
}
