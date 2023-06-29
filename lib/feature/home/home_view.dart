import 'package:flutter/material.dart';
import 'package:flutter_firebase_news_app/product/constants/color_constants.dart';
import 'package:flutter_firebase_news_app/product/constants/index.dart';
import 'package:flutter_firebase_news_app/product/widget/text/subtitle_text.dart';
import 'package:flutter_firebase_news_app/product/widget/text/title_text.dart';
import 'package:kartal/kartal.dart';

part './sub_view/home_chips.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: context.padding.paddingLow,
        children: [
          const _Header(),
          TextField(
            decoration: InputDecoration(
              hintText: StringConstants.homeSearchHint,
              prefixIcon: const Icon(Icons.search_outlined),
              suffixIcon: const Icon(Icons.mic_outlined),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
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
    );
  }
}

class _TagListviewBuilder extends StatelessWidget {
  const _TagListviewBuilder();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(.1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            return const _ActiveChip();
          }
          return const _PassiveChip();
        },
      ),
    );
  }
}

class _HorizontalListview extends StatelessWidget {
  const _HorizontalListview();
  static const dummyImage =
      'https://firebasestorage.googleapis.com/v0/b/flutter-full-news-e3c09.appspot.com/o/us-capitol.jpg?alt=media&token=357f78a6-c64b-4c89-95e4-99ca74f3995c';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const _HorizontalCard(dummyImage: dummyImage);
        },
      ),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  const _HorizontalCard({
    required this.dummyImage,
  });

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.padding.onlyRightPaddingLow,
          child: Image.network(
            dummyImage,
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: context.padding.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline,
                    size: WidgetSize.iconNormal.value.toDouble(),
                    color: ColorConstants.white,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: context.padding.paddingLow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SubtitleText(
                        title: 'POLITICS',
                        fontSize: 24,
                        color: ColorConstants.grayLighter,
                      ),
                      Text(
                        'The Latest situation in the presidential election.',
                        style: context.general.textTheme.headlineSmall
                            ?.copyWith(color: ColorConstants.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
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

class _RecommendedListview extends StatelessWidget {
  const _RecommendedListview();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return const _RecommendedCard();
      },
    );
  }
}

class _RecommendedCard extends StatelessWidget {
  const _RecommendedCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopPaddingLow,
      child: Row(
        children: [
          Image.network(
            _HorizontalListview.dummyImage,
            height: 96,
          ),
          Expanded(
            child: ListTile(
              minLeadingWidth: ImageSize.normal.value.toDouble(),
              title: const Text('UI/UX Design'),
              subtitle: const Text(
                'A Simple Trick For Creating Color Palettes Quickly',
              ),
            ),
          ),
        ],
      ),
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
