// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PassWordVisible)
const passWordVisibleProvider = PassWordVisibleProvider._();

final class PassWordVisibleProvider
    extends $NotifierProvider<PassWordVisible, bool> {
  const PassWordVisibleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passWordVisibleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passWordVisibleHash();

  @$internal
  @override
  PassWordVisible create() => PassWordVisible();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$passWordVisibleHash() => r'14527a12d0419b8c86ae7c7472935e5a102bef3b';

abstract class _$PassWordVisible extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
