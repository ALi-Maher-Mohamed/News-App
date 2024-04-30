import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_listVew.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('News'),
              Text(
                'Cloud',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: categoryListVew(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              NewListViewBuilder(
                category: 'general',
              )
            ],
          ),
          // child: Column(
          //   children: [
          //     categoryListVew(),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Expanded(child: NewsListVew())
          //   ],
          // ),
        ));
  }
}
