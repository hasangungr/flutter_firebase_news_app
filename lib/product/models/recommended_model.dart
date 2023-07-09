import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_news_app/product/utility/base/base_firebase_model.dart';

@immutable
class Recommmended
    with EquatableMixin, IdModel, BaseFirebaseModel<Recommmended> {
  const Recommmended({
    this.id,
    this.image,
    this.description,
    this.title,
  });

  final String? image;
  final String? description;
  final String? title;
  @override
  final String? id;

  @override
  List<Object?> get props => [image, description, title];

  Recommmended copyWith({
    String? image,
    String? description,
    String? title,
    String? id,
  }) {
    return Recommmended(
      id: id ?? this.id,
      image: image ?? this.image,
      description: description ?? this.description,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'description': description,
      'title': title,
    };
  }

  @override
  Recommmended fromJson(Map<String, dynamic> json) {
    return Recommmended(
      image: json['image'] as String?,
      description: json['description'] as String?,
      title: json['title'] as String?,
    );
  }
}
