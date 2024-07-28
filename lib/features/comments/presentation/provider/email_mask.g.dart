// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_mask.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initEmailMaskHash() => r'b5da5cb3f14e519cec49c1905fd7000ea363ceaf';

/// See also [initEmailMask].
@ProviderFor(initEmailMask)
final initEmailMaskProvider = AutoDisposeFutureProvider<void>.internal(
  initEmailMask,
  name: r'initEmailMaskProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$initEmailMaskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InitEmailMaskRef = AutoDisposeFutureProviderRef<void>;
String _$canMaskEmailHash() => r'c8f4f80784709f141706c4754483de748aaf3fdd';

/// See also [canMaskEmail].
@ProviderFor(canMaskEmail)
final canMaskEmailProvider = AutoDisposeStreamProvider<bool>.internal(
  canMaskEmail,
  name: r'canMaskEmailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$canMaskEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CanMaskEmailRef = AutoDisposeStreamProviderRef<bool>;
String _$maskedEmailHash() => r'27adf2d652f74cf795617b6c265014249f203f7c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [maskedEmail].
@ProviderFor(maskedEmail)
const maskedEmailProvider = MaskedEmailFamily();

/// See also [maskedEmail].
class MaskedEmailFamily extends Family<AsyncValue<String>> {
  /// See also [maskedEmail].
  const MaskedEmailFamily();

  /// See also [maskedEmail].
  MaskedEmailProvider call(
    String email,
  ) {
    return MaskedEmailProvider(
      email,
    );
  }

  @override
  MaskedEmailProvider getProviderOverride(
    covariant MaskedEmailProvider provider,
  ) {
    return call(
      provider.email,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'maskedEmailProvider';
}

/// See also [maskedEmail].
class MaskedEmailProvider extends AutoDisposeFutureProvider<String> {
  /// See also [maskedEmail].
  MaskedEmailProvider(
    String email,
  ) : this._internal(
          (ref) => maskedEmail(
            ref as MaskedEmailRef,
            email,
          ),
          from: maskedEmailProvider,
          name: r'maskedEmailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$maskedEmailHash,
          dependencies: MaskedEmailFamily._dependencies,
          allTransitiveDependencies:
              MaskedEmailFamily._allTransitiveDependencies,
          email: email,
        );

  MaskedEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<String> Function(MaskedEmailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MaskedEmailProvider._internal(
        (ref) => create(ref as MaskedEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _MaskedEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MaskedEmailProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MaskedEmailRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `email` of this provider.
  String get email;
}

class _MaskedEmailProviderElement
    extends AutoDisposeFutureProviderElement<String> with MaskedEmailRef {
  _MaskedEmailProviderElement(super.provider);

  @override
  String get email => (origin as MaskedEmailProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
