import 'package:flutter/material.dart';
import 'package:flutter_firebase_news_app/product/models/tags_model.dart';

class HomeSearchDelegate extends SearchDelegate<Tags?> {
  HomeSearchDelegate(this.tagItems);

  final List<Tags> tagItems;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = tagItems.where(
        (element) => element.name?.toLowerCase().contains(query) ?? false);

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(result.elementAt(index).name ?? ''),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = tagItems.where(
        (element) => element.name?.toLowerCase().contains(query) ?? false);

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(result.elementAt(index).name ?? ''),
          ),
        );
      },
    );
  }
}
