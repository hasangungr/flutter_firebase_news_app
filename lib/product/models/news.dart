import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_news_app/product/utility/base/base_firebase_model.dart';



class NewsModel extends Equatable with IdModel, BaseFirebaseModel<NewsModel> {
  const NewsModel({
    this.category,
    this.categoryId,
    this.title,
    this.backgroundImage,
    this.id,
  });

  final String? category;
  final String? categoryId;
  final String? title;
  final String? backgroundImage;
  @override
  final String? id;

  @override
  List<Object?> get props => [category, categoryId, title, backgroundImage, id];

  NewsModel copyWith({
    String? category,
    String? categoryId,
    String? title,
    String? backgroundImage,
    String? id,
  }) {
    return NewsModel(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'backgroundImage': backgroundImage,
      'id': id,
    };
  }

  @override
  NewsModel fromJson(Map<String, dynamic> json) {
    return NewsModel(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      id: json['id'] as String?,
    );
  }

 
}
