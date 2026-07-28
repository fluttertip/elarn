import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'data/stores/settings_store.dart';

class ELearnApp extends ConsumerWidget {
  const ELearnApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ELearn',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      routerConfig: appRouter,

      builder: (context, child) {
        final theme = Theme.of(context);
        final scheme = theme.colorScheme;
        final screenSize = MediaQuery.of(context).size;

        final isMobile = screenSize.width < 600;

        // On actual mobile-sized screens, show the app normally.
        if (isMobile) {
          return child ?? const SizedBox.shrink();
        }

        // Desktop / web: display the app inside a mobile-style device frame.
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                scheme.surface,
                Color.lerp(
                      scheme.surface,
                      scheme.primary,
                      0.06,
                    ) ??
                    scheme.surface,
                Color.lerp(
                      scheme.surface,
                      scheme.secondary,
                      0.04,
                    ) ??
                    scheme.surface,
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 420,
                    minHeight: 600,
                    maxHeight: 900,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? Colors.black
                          : const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(38),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.12),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.22),
                          blurRadius: 35,
                          spreadRadius: 4,
                          offset: const Offset(0, 18),
                        ),
                        BoxShadow(
                          color: scheme.primary.withOpacity(0.08),
                          blurRadius: 45,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(7),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Container(
                        color: scheme.surface,
                        child: Column(
                          children: [
                            // Mobile status bar / speaker area.
                            Container(
                              height: 30,
                              color: scheme.surface,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: theme.brightness ==
                                              Brightness.dark
                                          ? Colors.white24
                                          : Colors.black26,
                                      borderRadius:
                                          BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Actual application content.
                            Expanded(
                              child: Material(
                                color: scheme.surface,
                                child:
                                    child ?? const SizedBox.shrink(),
                              ),
                            ),

                            // Mobile home indicator.
                            Container(
                              height: 24,
                              color: scheme.surface,
                              alignment: Alignment.center,
                              child: Container(
                                width: 110,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: theme.brightness ==
                                          Brightness.dark
                                      ? Colors.white30
                                      : Colors.black26,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

