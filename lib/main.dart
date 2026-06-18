import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'providers/auth_provider.dart';
import 'pages/auth/login_page.dart';
import 'pages/onboarding/onboarding_parent.dart';
import 'widgets/main_navigation.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Memantau apakah ini pertama kali buka aplikasi
    final isFirstTime = ref.watch(isFirstTimeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      // LOGIC: Jika isFirstTime true ke Onboarding, jika false cek status login Firebase
      home: isFirstTime 
          ? const OnboardingParent() 
          : StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                // Tampilkan loading saat mengecek status auth
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryOrange),
                      ),
                    ),
                  );
                }
                
                // Jika user sudah login, langsung ke halaman utama
                if (snapshot.hasData) {
                  return const MainNavigation();
                }
                
                // Jika belum login, ke halaman login
                return const LoginPage();
              },
            ),
    );
  }
}