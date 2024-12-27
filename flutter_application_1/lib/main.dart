/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'screens/onboarding/intro_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UpTodo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: const IntroScreen(),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';
import 'controllers/main_controller.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainController()),
      ],
      child: MaterialApp(
        title: 'UpTodo',
        theme: AppTheme.darkTheme,
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';
import 'controllers/main_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainController(),
      child: MaterialApp(
        title: 'UpTodo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF121212),
          primaryColor: const Color(0xFF8875FF),
        ),
        home: const MainScreen(),
      ),
    );
  }
}*/
// File: lib/main.dart
/*
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_navigator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'controllers/main_controller.dart';
import 'controllers/task_controller.dart';
import 'controllers/auth_controller.dart';
import 'config/theme.dart';
import 'config/routes.dart';
import 'screens/onboarding/intro_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => MainController()),
        ChangeNotifierProvider(create: (_) => TaskController()),
      ],
      child: Consumer<AuthController>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'UpTodo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            home: auth.isInitialized
                ? auth.isAuthenticated
                    ? const MainNavigator()
                    : const IntroScreen()
                : const SplashScreen(),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 120),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_navigator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'controllers/main_controller.dart';
import 'controllers/task_controller.dart';
import 'controllers/auth_controller.dart';
import 'config/theme.dart';
import 'config/routes.dart';
import 'screens/onboarding/intro_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => MainController()),
        ChangeNotifierProvider(create: (_) => TaskController()),
      ],
      child: Consumer<AuthController>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'UpTodo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            home: auth.isInitialized
                ? auth.isAuthenticated
                    ? const MainNavigator()
                    : const IntroScreen()
                : const SplashScreen(),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 120),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
