import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class PassWordVisible extends _$PassWordVisible {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
