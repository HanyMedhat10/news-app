// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
    required this.articleModel,
  }) : super(key: key);
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: articleModel.image.toString(),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            // child: articleModel.image != null
            //     ? Image.network(
            //         articleModel.image!,
            //         height: 200,
            //         width: double.infinity,
            //         fit: BoxFit.cover,
            //       )
            //     : const SizedBox(
            //         height: 200,
            //         width: double.infinity,
            //       ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            articleModel.title,
            // '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articleModel.subTitle ?? '',
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          )
        ],
      ),
    );
  }
}
