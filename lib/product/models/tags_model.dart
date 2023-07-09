import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_news_app/product/utility/base/base_firebase_model.dart';

class Tags with EquatableMixin, IdModel, BaseFirebaseModel<Tags> {
  const Tags({
    this.name,
    this.active,
    this.id,
  });

  final String? name;
  final bool? active;
  @override
  final String? id;
  @override
  List<Object?> get props => [name, active];

  Tags copyWith({
    String? name,
    bool? active,
  }) {
    return Tags(
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'active': active,
    };
  }

  @override
  Tags fromJson(Map<String, dynamic> json) {
    return Tags(
      name: json['name'] as String?,
      active: json['active'] as bool?,
    );
  }
}
