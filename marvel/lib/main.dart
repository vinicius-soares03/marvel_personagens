import 'package:flutter/material.dart';
import 'package:marvel/layers/presentation/UI/pages/character_detail.dart/page/character_detail_page.dart';

import 'inject/inject.dart';
import 'layers/presentation/UI/pages/character_list/page/character_list_page.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Inject().initializeInject();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        debugShowCheckedModeBanner: false,
      initialRoute: CharacterListPage.ROUTE,
      routes: {
        CharacterListPage.ROUTE: (context) => const CharacterListPage(),
        CharacterDetailPage.ROUTE: (context) => CharacterDetailPage(character: null,),

      },
    );
  }
}



