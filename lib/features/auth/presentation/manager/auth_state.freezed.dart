// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function() loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function()? loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitializedState value) initialized,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthLoginSuccessState value) loginSuccess,
    required TResult Function(AuthStateLoginFailedState value) loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitializedState value)? initialized,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthLoginSuccessState value)? loginSuccess,
    TResult? Function(AuthStateLoginFailedState value)? loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializedState value)? initialized,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthLoginSuccessState value)? loginSuccess,
    TResult Function(AuthStateLoginFailedState value)? loginFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthInitializedStateImplCopyWith<$Res> {
  factory _$$AuthInitializedStateImplCopyWith(_$AuthInitializedStateImpl value,
          $Res Function(_$AuthInitializedStateImpl) then) =
      __$$AuthInitializedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitializedStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitializedStateImpl>
    implements _$$AuthInitializedStateImplCopyWith<$Res> {
  __$$AuthInitializedStateImplCopyWithImpl(_$AuthInitializedStateImpl _value,
      $Res Function(_$AuthInitializedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthInitializedStateImpl implements AuthInitializedState {
  const _$AuthInitializedStateImpl();

  @override
  String toString() {
    return 'AuthState.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthInitializedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function() loginFailed,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function()? loginFailed,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitializedState value) initialized,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthLoginSuccessState value) loginSuccess,
    required TResult Function(AuthStateLoginFailedState value) loginFailed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitializedState value)? initialized,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthLoginSuccessState value)? loginSuccess,
    TResult? Function(AuthStateLoginFailedState value)? loginFailed,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializedState value)? initialized,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthLoginSuccessState value)? loginSuccess,
    TResult Function(AuthStateLoginFailedState value)? loginFailed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class AuthInitializedState implements AuthState {
  const factory AuthInitializedState() = _$AuthInitializedStateImpl;
}

/// @nodoc
abstract class _$$AuthLoadingStateImplCopyWith<$Res> {
  factory _$$AuthLoadingStateImplCopyWith(_$AuthLoadingStateImpl value,
          $Res Function(_$AuthLoadingStateImpl) then) =
      __$$AuthLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingStateImpl>
    implements _$$AuthLoadingStateImplCopyWith<$Res> {
  __$$AuthLoadingStateImplCopyWithImpl(_$AuthLoadingStateImpl _value,
      $Res Function(_$AuthLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoadingStateImpl implements AuthLoadingState {
  const _$AuthLoadingStateImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function() loginFailed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function()? loginFailed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitializedState value) initialized,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthLoginSuccessState value) loginSuccess,
    required TResult Function(AuthStateLoginFailedState value) loginFailed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitializedState value)? initialized,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthLoginSuccessState value)? loginSuccess,
    TResult? Function(AuthStateLoginFailedState value)? loginFailed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializedState value)? initialized,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthLoginSuccessState value)? loginSuccess,
    TResult Function(AuthStateLoginFailedState value)? loginFailed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoadingState implements AuthState {
  const factory AuthLoadingState() = _$AuthLoadingStateImpl;
}

/// @nodoc
abstract class _$$AuthLoginSuccessStateImplCopyWith<$Res> {
  factory _$$AuthLoginSuccessStateImplCopyWith(
          _$AuthLoginSuccessStateImpl value,
          $Res Function(_$AuthLoginSuccessStateImpl) then) =
      __$$AuthLoginSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoginSuccessStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoginSuccessStateImpl>
    implements _$$AuthLoginSuccessStateImplCopyWith<$Res> {
  __$$AuthLoginSuccessStateImplCopyWithImpl(_$AuthLoginSuccessStateImpl _value,
      $Res Function(_$AuthLoginSuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoginSuccessStateImpl implements AuthLoginSuccessState {
  const _$AuthLoginSuccessStateImpl();

  @override
  String toString() {
    return 'AuthState.loginSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoginSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function() loginFailed,
  }) {
    return loginSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function()? loginFailed,
  }) {
    return loginSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitializedState value) initialized,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthLoginSuccessState value) loginSuccess,
    required TResult Function(AuthStateLoginFailedState value) loginFailed,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitializedState value)? initialized,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthLoginSuccessState value)? loginSuccess,
    TResult? Function(AuthStateLoginFailedState value)? loginFailed,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializedState value)? initialized,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthLoginSuccessState value)? loginSuccess,
    TResult Function(AuthStateLoginFailedState value)? loginFailed,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthLoginSuccessState implements AuthState {
  const factory AuthLoginSuccessState() = _$AuthLoginSuccessStateImpl;
}

/// @nodoc
abstract class _$$AuthStateLoginFailedStateImplCopyWith<$Res> {
  factory _$$AuthStateLoginFailedStateImplCopyWith(
          _$AuthStateLoginFailedStateImpl value,
          $Res Function(_$AuthStateLoginFailedStateImpl) then) =
      __$$AuthStateLoginFailedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateLoginFailedStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLoginFailedStateImpl>
    implements _$$AuthStateLoginFailedStateImplCopyWith<$Res> {
  __$$AuthStateLoginFailedStateImplCopyWithImpl(
      _$AuthStateLoginFailedStateImpl _value,
      $Res Function(_$AuthStateLoginFailedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateLoginFailedStateImpl implements AuthStateLoginFailedState {
  const _$AuthStateLoginFailedStateImpl();

  @override
  String toString() {
    return 'AuthState.loginFailed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateLoginFailedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() loading,
    required TResult Function() loginSuccess,
    required TResult Function() loginFailed,
  }) {
    return loginFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? loading,
    TResult? Function()? loginSuccess,
    TResult? Function()? loginFailed,
  }) {
    return loginFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? loading,
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) {
    if (loginFailed != null) {
      return loginFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitializedState value) initialized,
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthLoginSuccessState value) loginSuccess,
    required TResult Function(AuthStateLoginFailedState value) loginFailed,
  }) {
    return loginFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitializedState value)? initialized,
    TResult? Function(AuthLoadingState value)? loading,
    TResult? Function(AuthLoginSuccessState value)? loginSuccess,
    TResult? Function(AuthStateLoginFailedState value)? loginFailed,
  }) {
    return loginFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializedState value)? initialized,
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthLoginSuccessState value)? loginSuccess,
    TResult Function(AuthStateLoginFailedState value)? loginFailed,
    required TResult orElse(),
  }) {
    if (loginFailed != null) {
      return loginFailed(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoginFailedState implements AuthState {
  const factory AuthStateLoginFailedState() = _$AuthStateLoginFailedStateImpl;
}
