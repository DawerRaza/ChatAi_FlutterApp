import 'package:flutter/material.dart';
import 'package:personal_ai/providers/models_provider.dart';
import 'package:provider/provider.dart';

import 'Screens/chat_screen.dart';
import 'constants/constants.dart';

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
            create: (_)=> ModelsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
              color: cardColor,
          )
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
