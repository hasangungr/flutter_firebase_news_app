import 'package:flutter/material.dart';
import 'package:flutter_firebase_news_app/product/constants/index.dart';
import 'package:flutter_firebase_news_app/product/models/recommended_model.dart';
import 'package:kartal/kartal.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({required this.recommmended, super.key});

  final Recommmended recommmended;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopPaddingLow,
      child: Row(
        children: [
          Image.network(
            recommmended.image ?? '',
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
            height: 96,
          ),
          Expanded(
            child: ListTile(
              minLeadingWidth: ImageSize.normal.value.toDouble(),
              title: Text(recommmended.title ?? ''),
              subtitle: Text(
                recommmended.description ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
