// ignore_for_file: duplicate_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_listVew.dart';

class NewListViewBuilder extends StatefulWidget {
  const NewListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewListViewBuilder> createState() => _NewListViewBuilderState();
}

class _NewListViewBuilderState extends State<NewListViewBuilder> {
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getHeadLines(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListVew(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text('OOPs there was an error, try later'),
          );
        } else {
          return const SliverToBoxAdapter(
              child: Center(
            heightFactor: 18,
            child: CircularProgressIndicator(),
          ));
        }
      },
    );
  }
}
