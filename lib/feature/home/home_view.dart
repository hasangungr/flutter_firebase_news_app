import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_news_app/product/models/news.dart';
 import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference news =
        FirebaseFirestore.instance.collection('news');  //Firebase'de news key'li data setine bağlanır
       

    final response = news.withConverter(
      fromFirestore: (snapshot, options) { //Firestore'dan geleni modele dönüştürür
        return const NewsModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) { //modelli veriyi firestore tipine dönüştürür
//        if (value == null) throw FirebaseCustomException('$value is null');

        return value.toJson();
      },
    ).get();

    //Futurebuilder
    //onInit and show with SetState
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: response,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Placeholder();
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const LinearProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                final values =
                    snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (context, index) => Card(
                      child: Column(children: [
                    Image.network(
                      values[index].backgroundImage ?? '',
                      height: context.size!.height,
                    ),
                    Text(
                      values[index].title ?? '',
                      style: context.general.textTheme.labelLarge,
                    )
                  ],),),
                );
              } else {
                return const SizedBox();
              }
          }
        },
      ),
    );
  }
}
