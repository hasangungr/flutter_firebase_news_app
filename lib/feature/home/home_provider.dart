import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_news_app/product/models/news.dart';
import 'package:flutter_firebase_news_app/product/models/recommended_model.dart';
import 'package:flutter_firebase_news_app/product/models/tags_model.dart';
import 'package:flutter_firebase_news_app/product/utility/firebase/firebase_collection.dart';
import 'package:flutter_firebase_news_app/product/utility/firebase/firebase_utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends StateNotifier<HomeState> with FirebaseUtility {
  HomeNotifier() : super(const HomeState());

  List<Tags> _fullTagList = [];
  List<Tags> get fullTagList => _fullTagList;

  Future<void> fetchNews() async {
    final items = await fetcList<NewsModel, NewsModel>(
      const NewsModel(),
      FirebaseCollections.news,
    );

    state = state.copyWith(news: items);
  }

  Future<void> fetchTags() async {
    final items = await fetcList<Tags, Tags>(
      const Tags(),
      FirebaseCollections.tags,
    );

    state = state.copyWith(tags: items);
    _fullTagList = items ?? [];
  }

  Future<void> fetchRecommended() async {
    final items = await fetcList<Recommmended, Recommmended>(
      const Recommmended(),
      FirebaseCollections.recommended,
    );

    state = state.copyWith(recommendeds: items);
  }

  Future<void> fetchAndLoad() async {
    state.copyWith(isLoad: true);

    await fetchNews();
    await fetchTags();
    await fetchRecommended();
    await Future.wait([fetchNews(), fetchTags(), fetchRecommended()]);
    state.copyWith(isLoad: false);
  }
}

class HomeState extends Equatable {
  const HomeState({this.isLoad, this.news, this.tags, this.recommendeds});

  final bool? isLoad;
  final List<NewsModel>? news;
  final List<Tags>? tags;
  final List<Recommmended>? recommendeds;

  @override
  List<Object?> get props => [news, isLoad, tags, recommendeds];

  HomeState copyWith({
    List<NewsModel>? news,
    List<Tags>? tags,
    List<Recommmended>? recommendeds,
    bool? isLoad,
  }) {
    return HomeState(
      isLoad: isLoad ?? this.isLoad,
      news: news ?? this.news,
      tags: tags ?? this.tags,
      recommendeds: recommendeds ?? this.recommendeds,
    );
  }
}
