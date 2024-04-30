// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_post.dart';

class NewsListVew extends StatelessWidget {
  const NewsListVew({
    super.key, required this.articles,
  });

 final List<ArticleModel> articles ;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsSection(
              articleModel: articles[index],
            ),
          );
        },
      ),
    );
  }
}
