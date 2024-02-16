import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jangangolputyukkapp/cubit/coblos_cubit.dart';
import 'package:jangangolputyukkapp/pages/splash_page.dart';
import 'package:jangangolputyukkapp/pages/vote_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
          apiKey: 'AIzaSyCk-YlmojEreuCzGT6YENdGgBixRCWcjmw',
          appId: '1:941134192692:android:5e0fe966812b1d0d00aa61',
          messagingSenderId: '941134192692',
          projectId: 'vote-app-7bacd',
        ))
      : await Firebase.initializeApp;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoblosCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Vote App',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const StartPage(),
          '/vote': (context) => const VotePage(),
        },
      ),
    );
  }
}
