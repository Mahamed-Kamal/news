import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';

import '../../api/model/sources_responses/Source.dart';

class NewsFragmentViewModel extends Cubit<NewsFragmentState> {
  NewsFragmentViewModel() : super(LoadingState(loadingMesseage: 'Loading...'));

  void loadNewsSources(String categoryId) async {
    try {
      var response = await ApiManager.getNewsSources(categoryId);
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message ?? ''));
        return;
      }
      if (response.status == 'ok') {
        emit(SuccessState(response.sources!));
        return;
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

abstract class NewsFragmentState {}

// loading -- error -- success

class LoadingState extends NewsFragmentState {
  String? loadingMesseage;

  LoadingState({this.loadingMesseage});
}

class ErrorState extends NewsFragmentState {
  String? errorMessage;
  Exception? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends NewsFragmentState {
  List<Source> source;

  SuccessState(this.source);
}
