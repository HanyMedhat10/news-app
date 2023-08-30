// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(
            category: 'general',
          ),
        ],
      ),
    );
  }
}
