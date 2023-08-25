import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 22.0),
          child: NewsTile(),
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
