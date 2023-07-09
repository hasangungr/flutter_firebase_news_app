import 'package:flutter/material.dart';
import 'package:flutter_firebase_news_app/feature/home/home_provider.dart';
import 'package:flutter_firebase_news_app/feature/home/sub_view/home_search_delegate.dart';
import 'package:flutter_firebase_news_app/product/constants/color_constants.dart';
import 'package:flutter_firebase_news_app/product/constants/index.dart';
import 'package:flutter_firebase_news_app/product/models/tags_model.dart';
import 'package:flutter_firebase_news_app/product/widget/card/home_news_card.dart';
import 'package:flutter_firebase_news_app/product/widget/card/recommended_card.dart';
import 'package:flutter_firebase_news_app/product/widget/text/subtitle_text.dart';
import 'package:flutter_firebase_news_app/product/widget/text/title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

part './sub_view/home_chips.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    //Firstly do it
    Future.microtask(
      () => ref.read(_homeProvider.notifier).fetchAndLoad(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: context.padding.paddingLow,
              children: [
                const _Header(),
                TextField(
                  onTap: () {
                    final result = showSearch(
                      context: context,
                      delegate: HomeSearchDelegate(
                        ref.read(_homeProvider.notifier).fullTagList,
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: StringConstants.homeSearchHint,
                    prefixIcon: const Icon(Icons.search_outlined),
                    suffixIcon: const Icon(Icons.mic_outlined),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    filled: true,
                    fillColor: ColorConstants.grayLighter,
                  ),
                ),
                const _TagListviewBuilder(),
                const _HorizontalListview(),
                const _RecommendedHeader(),
                const _RecommendedListview(),
              ],
            ),
            if (ref.watch(_homeProvider).isLoad ?? false)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class _TagListviewBuilder extends ConsumerWidget {
  const _TagListviewBuilder();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItems = ref.watch(_homeProvider).tags ?? [];
    return SizedBox(
      height: context.sized.dynamicHeight(.1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final tagItem = newsItems[index];
          if (tagItem.active ?? false) {
            return _ActiveChip(tagItem);
          }
          return _PassiveChip(tagItem);
        },
      ),
    );
  }
}

class _HorizontalListview extends ConsumerWidget {
  const _HorizontalListview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItems = ref.watch(_homeProvider).news ?? [];

    return SizedBox(
      height: context.sized.dynamicHeight(.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return HomeNewsHorizontalCard(
            newsItem: newsItems[index],
          );
        },
      ),
    );
  }
}

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleText(title: StringConstants.homeSecondTitle),
        TextButton(
          onPressed: () {},
          child: SubtitleText(title: StringConstants.seeAll),
        )
      ],
    );
  }
}

class _RecommendedListview extends ConsumerWidget {
  const _RecommendedListview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItems = ref.watch(_homeProvider).recommendeds ?? [];

    return ListView.builder(
      itemCount: newsItems.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return RecommendedCard(
          recommmended: newsItems[index],
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(title: StringConstants.homeTitle),
        SubtitleText(title: StringConstants.homeSubtitle)
      ],
    );
  }
}
