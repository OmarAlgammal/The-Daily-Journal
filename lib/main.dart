import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/routing/routers.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/services/firebase_auth_service.dart';
import 'package:the_daily_journal/utils/theme/light_theme/light_theme.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_cubit.dart';
import 'package:the_daily_journal/view_model/bookmarks_cubit/bookmark_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(FirebaseAuthentication()),),
        BlocProvider(create: (context) => BookmarkCubit()),
      ],
      child: MaterialApp(
        onGenerateRoute: onGenerate,
        initialRoute: AppRouts.landingScreen,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme(),
        //home: BottomNavScreen(),
      ),
    );
  }
}
