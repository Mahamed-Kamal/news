import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/category.dart';
import 'package:news/screens/articles_screen/articles_screen.dart';

import 'news_fragment_viewModel.dart';

class HomeNewsFragment extends StatelessWidget {
  CategoryModel category;
  String query;
  var viewModel = NewsFragmentViewModel();

  HomeNewsFragment(this.category, this.query);

  @override
  Widget build(BuildContext context) {
    viewModel.loadNewsSources(category.id);
    return BlocBuilder<NewsFragmentViewModel, NewsFragmentState>(
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
                Text(state.loadingMesseage ?? '')
              ],
            ),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('Try Again')),
              ],
            ),
          );
        } else if (state is SuccessState) {
          return ArticlesScreen(state.source, query);
        }
        return Container();
      },
    );
  }
}
