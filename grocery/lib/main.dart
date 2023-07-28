import 'package:flutter/material.dart';
import 'package:grocery/consts/theme_data.dart';
import 'package:grocery/inner_screen/feed_screen.dart';
import 'package:grocery/inner_screen/on_sale_screen.dart';
import 'package:grocery/provider/dark_theme.dart';
import 'package:grocery/screens/bottom_bar.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: BottomBarTab(),
          routes: {
            OnSaleScreen.routeName: (context) => const OnSaleScreen(),
            FeedScreen.routeName: (context) => const FeedScreen()
          },
        );
      }),
    );
  }
}
