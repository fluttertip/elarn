import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_providers.dart';

final themeModeProvider = NotifierProvider<ThemeModeStore, bool>(ThemeModeStore.new);

class ThemeModeStore extends Notifier<bool> {
  @override
  bool build() => ref.watch(preferencesProvider).getBool('settings.v1.dark') ?? false;

  Future<void> setDark(bool value) async {
    await ref.read(preferencesProvider).setBool('settings.v1.dark', value);
    state = value;
  }
}
