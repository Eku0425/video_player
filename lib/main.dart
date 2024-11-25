import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:video_player/provider/provider.dart';
import 'package:video_player/provider/song_provider.dart';
import 'package:video_player/view/home_page.dart';
import 'package:video_player/view/search_page.dart';
import 'package:video_player/view/song_page.dart';
import 'package:video_player/view/splash_page.dart';
import 'package:video_player/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SongProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash': (context) => SplashScreen(),
          '/': (context) => SplashPage(),
          '/home': (context) => const HomePage(),
          '/screen': (context) => const SearchScreen(),
          '/song': (context) => const SongPlayPage(),
        },
      ),
    );
  }
}
