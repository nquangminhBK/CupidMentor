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
  LoggedInUserInfo get userInfo => throw _privateConstructorUsedError;
  bool get canGoNext => throw _privateConstructorUsedError;
  Either<UIError, UISuccess>? get errorOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {LoggedInUserInfo userInfo,
      bool canGoNext,
      Either<UIError, UISuccess>? errorOrSuccess});

  $LoggedInUserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
    Object? canGoNext = null,
    Object? errorOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as LoggedInUserInfo,
      canGoNext: null == canGoNext
          ? _value.canGoNext
          : canGoNext // ignore: cast_nullable_to_non_nullable
              as bool,
      errorOrSuccess: freezed == errorOrSuccess
          ? _value.errorOrSuccess
          : errorOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<UIError, UISuccess>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoggedInUserInfoCopyWith<$Res> get userInfo {
    return $LoggedInUserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoggedInUserInfo userInfo,
      bool canGoNext,
      Either<UIError, UISuccess>? errorOrSuccess});

  @override
  $LoggedInUserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
    Object? canGoNext = null,
    Object? errorOrSuccess = freezed,
  }) {
    return _then(_$OnboardingStateImpl(
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as LoggedInUserInfo,
      canGoNext: null == canGoNext
          ? _value.canGoNext
          : canGoNext // ignore: cast_nullable_to_non_nullable
              as bool,
      errorOrSuccess: freezed == errorOrSuccess
          ? _value.errorOrSuccess
          : errorOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<UIError, UISuccess>?,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl extends _OnboardingState {
  const _$OnboardingStateImpl(
      {required this.userInfo,
      required this.canGoNext,
      required this.errorOrSuccess})
      : super._();

  @override
  final LoggedInUserInfo userInfo;
  @override
  final bool canGoNext;
  @override
  final Either<UIError, UISuccess>? errorOrSuccess;

  @override
  String toString() {
    return 'OnboardingState(userInfo: $userInfo, canGoNext: $canGoNext, errorOrSuccess: $errorOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.canGoNext, canGoNext) ||
                other.canGoNext == canGoNext) &&
            (identical(other.errorOrSuccess, errorOrSuccess) ||
                other.errorOrSuccess == errorOrSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userInfo, canGoNext, errorOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);
}

abstract class _OnboardingState extends OnboardingState {
  const factory _OnboardingState(
          {required final LoggedInUserInfo userInfo,
          required final bool canGoNext,
          required final Either<UIError, UISuccess>? errorOrSuccess}) =
      _$OnboardingStateImpl;
  const _OnboardingState._() : super._();

  @override
  LoggedInUserInfo get userInfo;
  @override
  bool get canGoNext;
  @override
  Either<UIError, UISuccess>? get errorOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
