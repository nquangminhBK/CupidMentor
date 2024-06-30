// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)
        infoUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)?
        infoUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)?
        infoUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitializedState value) initialized,
    required TResult Function(OnboardingInfoUpdatedState value) infoUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitializedState value)? initialized,
    TResult? Function(OnboardingInfoUpdatedState value)? infoUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitializedState value)? initialized,
    TResult Function(OnboardingInfoUpdatedState value)? infoUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OnboardingInitializedStateImplCopyWith<$Res> {
  factory _$$OnboardingInitializedStateImplCopyWith(
          _$OnboardingInitializedStateImpl value,
          $Res Function(_$OnboardingInitializedStateImpl) then) =
      __$$OnboardingInitializedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnboardingInitializedStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res,
        _$OnboardingInitializedStateImpl>
    implements _$$OnboardingInitializedStateImplCopyWith<$Res> {
  __$$OnboardingInitializedStateImplCopyWithImpl(
      _$OnboardingInitializedStateImpl _value,
      $Res Function(_$OnboardingInitializedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnboardingInitializedStateImpl implements OnboardingInitializedState {
  const _$OnboardingInitializedStateImpl();

  @override
  String toString() {
    return 'OnboardingState.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingInitializedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)
        infoUpdated,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)?
        infoUpdated,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)?
        infoUpdated,
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
    required TResult Function(OnboardingInitializedState value) initialized,
    required TResult Function(OnboardingInfoUpdatedState value) infoUpdated,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitializedState value)? initialized,
    TResult? Function(OnboardingInfoUpdatedState value)? infoUpdated,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitializedState value)? initialized,
    TResult Function(OnboardingInfoUpdatedState value)? infoUpdated,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class OnboardingInitializedState implements OnboardingState {
  const factory OnboardingInitializedState() = _$OnboardingInitializedStateImpl;
}

/// @nodoc
abstract class _$$OnboardingInfoUpdatedStateImplCopyWith<$Res> {
  factory _$$OnboardingInfoUpdatedStateImplCopyWith(
          _$OnboardingInfoUpdatedStateImpl value,
          $Res Function(_$OnboardingInfoUpdatedStateImpl) then) =
      __$$OnboardingInfoUpdatedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoggedInUserInfo userInfo, CrushInfo? crushInfo});

  $LoggedInUserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$OnboardingInfoUpdatedStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res,
        _$OnboardingInfoUpdatedStateImpl>
    implements _$$OnboardingInfoUpdatedStateImplCopyWith<$Res> {
  __$$OnboardingInfoUpdatedStateImplCopyWithImpl(
      _$OnboardingInfoUpdatedStateImpl _value,
      $Res Function(_$OnboardingInfoUpdatedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
    Object? crushInfo = freezed,
  }) {
    return _then(_$OnboardingInfoUpdatedStateImpl(
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as LoggedInUserInfo,
      crushInfo: freezed == crushInfo
          ? _value.crushInfo
          : crushInfo // ignore: cast_nullable_to_non_nullable
              as CrushInfo?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LoggedInUserInfoCopyWith<$Res> get userInfo {
    return $LoggedInUserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }
}

/// @nodoc

class _$OnboardingInfoUpdatedStateImpl implements OnboardingInfoUpdatedState {
  const _$OnboardingInfoUpdatedStateImpl(
      {required this.userInfo, this.crushInfo});

  @override
  final LoggedInUserInfo userInfo;
  @override
  final CrushInfo? crushInfo;

  @override
  String toString() {
    return 'OnboardingState.infoUpdated(userInfo: $userInfo, crushInfo: $crushInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingInfoUpdatedStateImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.crushInfo, crushInfo) ||
                other.crushInfo == crushInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInfo, crushInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingInfoUpdatedStateImplCopyWith<_$OnboardingInfoUpdatedStateImpl>
      get copyWith => __$$OnboardingInfoUpdatedStateImplCopyWithImpl<
          _$OnboardingInfoUpdatedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)
        infoUpdated,
  }) {
    return infoUpdated(userInfo, crushInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)?
        infoUpdated,
  }) {
    return infoUpdated?.call(userInfo, crushInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(LoggedInUserInfo userInfo, CrushInfo? crushInfo)?
        infoUpdated,
    required TResult orElse(),
  }) {
    if (infoUpdated != null) {
      return infoUpdated(userInfo, crushInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnboardingInitializedState value) initialized,
    required TResult Function(OnboardingInfoUpdatedState value) infoUpdated,
  }) {
    return infoUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnboardingInitializedState value)? initialized,
    TResult? Function(OnboardingInfoUpdatedState value)? infoUpdated,
  }) {
    return infoUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnboardingInitializedState value)? initialized,
    TResult Function(OnboardingInfoUpdatedState value)? infoUpdated,
    required TResult orElse(),
  }) {
    if (infoUpdated != null) {
      return infoUpdated(this);
    }
    return orElse();
  }
}

abstract class OnboardingInfoUpdatedState implements OnboardingState {
  const factory OnboardingInfoUpdatedState(
      {required final LoggedInUserInfo userInfo,
      final CrushInfo? crushInfo}) = _$OnboardingInfoUpdatedStateImpl;

  LoggedInUserInfo get userInfo;
  CrushInfo? get crushInfo;
  @JsonKey(ignore: true)
  _$$OnboardingInfoUpdatedStateImplCopyWith<_$OnboardingInfoUpdatedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
