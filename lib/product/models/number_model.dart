import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_news_app/product/utility/base/base_firebase_model.dart';

// ignore: must_be_immutable
class NumberModel extends Equatable
    with IdModel, BaseFirebaseModel<NumberModel> {
  NumberModel({
    this.number,
  });
  final String? number;

  NumberModel copyWith({
    String? number,
  }) {
    return NumberModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  NumberModel fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'] as String?,
    );
  }

  @override
  String? id = '';

  @override
  List<Object?> get props => throw UnimplementedError();
}
