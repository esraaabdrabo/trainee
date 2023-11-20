// ignore_for_file: constant_identifier_names

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../domain/entity/story_entity.dart';
import '../bloc/home_cubit.dart';

class ExploreScreenNotifier extends ScreenNotifier {
  static const int LOADING_WIDGET_ID = -938482928475739298;
  static const int ERROR_WIDGET_ID = -938482284735739196;

  /// Fields
  late BuildContext context;
  final HomeCubit homeCubit = HomeCubit();
  VideoPlayerController? _videoPlayerController;
  bool imageLoaded = false;
  bool _loading = false;
  bool _isEmpty = false;
  bool isFirstRequest = true;
  int _dataFetched = 0;
  String? _errorMsg;
  List<StoryEntity> _stories = [];

  CarouselController _carouselController = CarouselController();
  int _pageIndex = 0;
  int _duration = 0;
  int maxDuration = 15000;
  ExploreScreenNotifier() {}

  /// Getters and Setters

  VideoPlayerController? get videoPlayerController => _videoPlayerController;

  set videoPlayerController(VideoPlayerController? value) {
    _videoPlayerController = value;
  }

  List<StoryEntity> get stories => _stories;

  void addToStories(List<StoryEntity> value, {bool isLoading = false}) {
    if (!isLoading) removeLoadingWidget();
    int oldDataFetched = _dataFetched;
    _stories.addAll(value.where((element) {
      bool unique = true;
      _stories.forEach((element2) {
        if (element.id == element2.id) {
          unique = false;
        }
      });
      if (unique && element.id != LOADING_WIDGET_ID && element.isShared != true)
        dataFetched++;
      return unique;
    }));

    if (!isLoading) {
      if (oldDataFetched == _dataFetched)
        carouselController.previousPage(curve: Curves.ease);
      addToStories([StoryEntity(id: ExploreScreenNotifier.LOADING_WIDGET_ID)],
          isLoading: true);
    }

    notifyListeners();
    if (!isLoading) loading = false;
  }

  int get dataFetched => _dataFetched;

  set dataFetched(int value) {
    _dataFetched = value;
    notifyListeners();
  }

  bool get isEmpty => _isEmpty;

  set isEmpty(bool value) {
    _isEmpty = value;
    notifyListeners();
  }

  void removeLoadingWidget() {
    _stories.removeWhere(
        (element) => element.id == ExploreScreenNotifier.LOADING_WIDGET_ID);
  }

  CarouselController get carouselController => _carouselController;

  set carouselController(CarouselController value) {
    _carouselController = value;
  }

  int get pageIndex => _pageIndex;

  set pageIndex(int value) {
    _pageIndex = value;
  }

  int get duration => _duration;

  set duration(int value) {
    _duration = value;
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String? get errorMsg => _errorMsg;

  set errorMsg(String? value) {
    _errorMsg = value;
  }

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
    homeCubit.close();
    _videoPlayerController?.dispose();
  }
}
