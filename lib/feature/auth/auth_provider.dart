import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_news_app/product/constants/cache_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppAuthNotifier extends StateNotifier<AppAuthState> {
  AppAuthNotifier() : super(const AppAuthState());

  Future<void> fetchUserDetail(User? user) async {
    if (user == null) return;
    final token = await user.getIdToken();
    await tokenSaveToCache(token);
    state = state.copyWith(isRedirect: true);
  }

  Future<void> tokenSaveToCache(String token) async {
    await CacheItems.token.write(token);
  }
}

class AppAuthState extends Equatable {
  const AppAuthState({this.isRedirect = false});

  final bool isRedirect;

  @override
  List<Object?> get props => [isRedirect];

  AppAuthState copyWith({
    bool? isRedirect,
  }) {
    return AppAuthState(isRedirect: isRedirect ?? this.isRedirect);
  }
}
