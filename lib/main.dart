import 'package:flutter/material.dart';
import 'package:elearningapp/views/Onboarding_screen/onboarding_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-learning App',
          theme: ThemeData(
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: AppColors.accent,
              primary: AppColors.primary,
              background: AppColors.background,
              error: AppColors.error,
            ),
            textTheme: ThemeData.light().textTheme.apply(
                  bodyColor: AppColors.text,
                  displayColor: AppColors.text,
                ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.background,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
                foregroundColor: AppColors.background,
              ),
            ),
            cardColor: AppColors.card,
          ),
          builder: (context, child) {
            if (isMobile) {
              return child!;
            }

            return Scaffold(
              backgroundColor: AppColors.background,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "This app is best viewed in mobile size. Please resize your browser.",
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      height: 800,
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: child!,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          home: const OnboardingScreen(),
        );
      },
    );
  }
}
