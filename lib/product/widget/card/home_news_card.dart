import 'package:flutter/material.dart';
import 'package:flutter_firebase_news_app/product/constants/color_constants.dart';
import 'package:flutter_firebase_news_app/product/constants/index.dart';
import 'package:flutter_firebase_news_app/product/models/news.dart';
import 'package:flutter_firebase_news_app/product/widget/text/subtitle_text.dart';
import 'package:kartal/kartal.dart';

class HomeNewsHorizontalCard extends StatelessWidget {
  const HomeNewsHorizontalCard({
    required this.newsItem,
    super.key,
  });

  final NewsModel? newsItem;

  @override
  Widget build(BuildContext context) {
    if (newsItem == null) return const SizedBox.shrink();
    return Stack(
      children: [
        Padding(
          padding: context.padding.onlyRightPaddingLow,
          child: Image.network(
            newsItem!.backgroundImage ?? ' ',
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
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
                      SubtitleText(
                        title: newsItem!.category ?? '',
                        fontSize: 24,
                        color: ColorConstants.grayLighter,
                      ),
                      Text(
                        newsItem!.title ?? '',
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
