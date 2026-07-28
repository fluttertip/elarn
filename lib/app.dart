import 'package:flutter/foundation.dart';
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

        // On native mobile devices, show the app normally.
        // On web, show the preview frame and footer even in a narrow browser.
        if (!kIsWeb && isMobile) {
          return child ?? const SizedBox.shrink();
        }

        if (!kIsWeb) {
          return child ?? const SizedBox.shrink();
        }

        // Web preview with footer.
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                scheme.surface,
                Color.lerp(scheme.surface, scheme.primary, 0.06) ??
                    scheme.surface,
                Color.lerp(scheme.surface, scheme.secondary, 0.04) ??
                    scheme.surface,
              ],
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    // Main area containing the centered mobile frame.
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
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
                                                color:
                                                    theme.brightness ==
                                                        Brightness.dark
                                                    ? Colors.white24
                                                    : Colors.black26,
                                                borderRadius: BorderRadius.circular(
                                                  10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Actual application content.
                                      Expanded(
                                        child: Material(
                                          color: scheme.surface,
                                          child: child ?? const SizedBox.shrink(),
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
                                            color:
                                                theme.brightness == Brightness.dark
                                                ? Colors.white30
                                                : Colors.black26,
                                            borderRadius: BorderRadius.circular(10),
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
                    const SizedBox(height: 48),
                  ],
                ),
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: scheme.surface.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: scheme.onSurface.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Zoom out browser for the best experience',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                              color: scheme.onSurface.withOpacity(1),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Made by Niranjan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.1,
                            color: scheme.onSurface.withOpacity(1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
