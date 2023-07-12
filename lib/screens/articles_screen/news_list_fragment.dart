import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/model/sources_responses/Source.dart';
import '../../shared/style/componenets/article_item.dart';
import 'news_list_viewModel.dart';

class NewsListFragment extends StatelessWidget {
  Source? source;
  String query;

  NewsListFragment(this.source, this.query);

  var viewModel = NewsListViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.loadNews(sourceId: source?.id ?? '', query: query);
    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 12,
                ),
                Text(state.loadingMessage ?? '')
              ],
            ),
          );
        }
        if (state is ErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage ?? ''),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Error loading data..Try Again'))
              ],
            ),
          );
        }
        if (state is SuccessState) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(12),
              itemBuilder: (context, index) =>
                  ArticleItem(state.articles[index]),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: state.articles.length ?? 0,
            ),
          );
        }
        return Container();
      },
    );
  }
}
