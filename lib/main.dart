import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertycp/screens/appIntro/app_intro_screen.dart';
import 'package:propertycp/screens/home_container/home_container.dart';
import 'package:propertycp/screens/onboarding/login_screen.dart';
import 'package:propertycp/services/api_service.dart';
import 'package:propertycp/services/storage_service.dart';
import 'package:propertycp/utils/colors.dart';
import 'package:propertycp/utils/enum.dart';
import 'package:propertycp/utils/preference_key.dart';
import 'package:propertycp/utils/router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'models/user_model.dart';

late SharedPreferences prefs;
UserModel? userModel;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  if (prefs.getInt(SharedpreferenceKey.userId) != null) {
    log('User found in cache, fething user details');
    userModel =
        await ApiProvider().getUserById(SharedpreferenceKey.getUserId());
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StorageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PropertyCP',
        theme: ThemeData(
          useMaterial3: false,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.blueGrey).copyWith(
            background: scaffoldBackgroundColor,
            primary: Colors.blueGrey,
            secondary: Colors.blueGrey,
          ),
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
                  .apply(
            bodyColor: textColorDark,
            displayColor: textColorDark,
          ),
        ),
        home: getHomeScreen(),
        onGenerateRoute: NavRoute.generatedRoute,
      ),
    );
  }

  getHomeScreen() {
    if (prefs.getBool(SharedpreferenceKey.firstTimeAppOpen) ?? true) {
      prefs.setBool(SharedpreferenceKey.firstTimeAppOpen, false);
      return const AppIntroScreen();
    } else if (userModel == null || userModel?.id == null) {
      return const LoginScreen();
    } else if ((userModel!.status) == UserStatus.CREATED.name) {
      return const LoginScreen();
    } else if ((userModel!.status) == UserStatus.PENDING.name ||
        (userModel!.status) == UserStatus.CREATED.name) {
      return const LoginScreen();
    } else if ((userModel!.status) == UserStatus.SUSPENDED.name) {
      return const LoginScreen();
    }
    return const HomeContainer();
  }
}
