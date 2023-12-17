import 'package:dummy_api_user_tryingto_hit/Bloc/wallpaper_bloc.dart';
import 'package:dummy_api_user_tryingto_hit/api/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Splash_screen.dart';
import 'Wallpaper_Page.dart';


void main() {
  runApp(BlocProvider(create: (context) => WallpaperBloc(apiHelper: ApiHelper()),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: WallpaperPage(),
    );
  }
}