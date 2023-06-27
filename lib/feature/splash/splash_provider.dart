import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_news_app/product/constants/platform_enum.dart';
import 'package:flutter_firebase_news_app/product/models/number_model.dart';
import 'package:flutter_firebase_news_app/product/utility/firebase/firebase_collection.dart';
import 'package:flutter_firebase_news_app/product/utility/version_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkApplicationVersion(String clientVersion) async {
    final dbValue = await getVersionNumberFromDatabase();

    if (dbValue == null || dbValue.isEmpty) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    final checkIsNeedForceUpdate =
        VersionManager(deviceValue: clientVersion, databaseValue: dbValue);

    if (checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    state = state.copyWith(isRedirectHome: true);
  }

// If User use from browser, we dont need to check version control
  Future<String?> getVersionNumberFromDatabase() async {
    if (kIsWeb) return null;

    final response = await FirebaseCollections.version.reference
        .withConverter<NumberModel>(
          fromFirestore: (snapshot, options) =>
              NumberModel().fromFirebase(snapshot),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(PlatformEnum.versionName)
        .get();

    debugPrint(response.data()?.number.toString());

    return response.data()?.number;
  }
}

class SplashState extends Equatable { //Go To Home Page Permission 
// if rediretHome true, you can go to HomeView
  const SplashState({this.isRequiredForceUpdate, this.isRedirectHome});

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  @override
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
