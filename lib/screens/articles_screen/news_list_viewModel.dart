import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';

import '../../api/model/news_responses/News.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState(loadingMessage: 'Loading...'));

  void loadNews({String? sourceId, String? query}) async {
    try {
      var response = await ApiManager.getNews(sourceId: sourceId, q: query);
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message ?? ''));
        return;
      }
      if (response.status == 'ok') {
        emit(SuccessState(response.articles!));
      }
    } on TimeoutException catch (e) {
      emit(ErrorState(
          errorMessage: "coulde'nt reach server"
              "please check your internet connection"));
    } on Exception catch (e) {
      emit(ErrorState(
          errorMessage: "something went wrong"
              "please try again"));
    }
  }
}

abstract class NewsListState {}

class LoadingState extends NewsListState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsListState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends NewsListState {
  List<News> articles;

  SuccessState(this.articles);
}
