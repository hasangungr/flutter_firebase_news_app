import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebaseui;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_news_app/feature/auth/auth_provider.dart';
import 'package:flutter_firebase_news_app/product/constants/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppAuthView extends ConsumerStatefulWidget {
  const AppAuthView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppAuthViewState();
}

class _AppAuthViewState extends ConsumerState<AppAuthView> {
  final authProvider = StateNotifierProvider<AppAuthNotifier, AppAuthState>(
    (ref) {
      return AppAuthNotifier();
    },
  );

  @override
  void initState() {
    super.initState();
    ref
        .read(authProvider.notifier)
        .fetchUserDetail(FirebaseAuth.instance.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            firebaseui.FirebaseUIActions(
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  if (state.user != null) {
                    ref
                        .read(authProvider.notifier)
                        .fetchUserDetail(FirebaseAuth.instance.currentUser);
                    debugPrint('Giriş');
                  } else {
                    Navigator.pushReplacementNamed(context, '/profile');
                  }
                }),
              ],
              child: firebaseui.LoginView(
                showTitle: false,
                action: firebaseui.AuthAction.signIn,
                providers: firebaseui.FirebaseUIAuth.providersFor(
                  FirebaseAuth.instance.app,
                ),
              ),
            ),
            if (ref.watch(authProvider).isRedirect)
              TextButton(
                onPressed: () {},
                child: Text(StringConstants.countinueApp),
              )
          ],
        ),
      ),
    );
  }
}
