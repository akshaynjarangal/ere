import 'package:ereakshay/src/provider/post_provider.dart';
import 'package:ereakshay/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/constants/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(ChangeNotifierProvider(
      create: (context) => getIt<PostProvider>()..getUserPosts,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ERE Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0f172a)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
