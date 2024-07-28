// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tip_date_spot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TipsDateSpotState {
  Map<String, List<ContentResponse>> get content =>
      throw _privateConstructorUsedError;
  LoggedInUserInfo get userInfo => throw _privateConstructorUsedError;
  Either<UIError, UISuccess>? get errorOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TipsDateSpotStateCopyWith<TipsDateSpotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsDateSpotStateCopyWith<$Res> {
  factory $TipsDateSpotStateCopyWith(
          TipsDateSpotState value, $Res Function(TipsDateSpotState) then) =
      _$TipsDateSpotStateCopyWithImpl<$Res, TipsDateSpotState>;
  @useResult
  $Res call(
      {Map<String, List<ContentResponse>> content,
      LoggedInUserInfo userInfo,
      Either<UIError, UISuccess>? errorOrSuccess});

  $LoggedInUserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$TipsDateSpotStateCopyWithImpl<$Res, $Val extends TipsDateSpotState>
    implements $TipsDateSpotStateCopyWith<$Res> {
  _$TipsDateSpotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? userInfo = null,
    Object? errorOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContentResponse>>,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as LoggedInUserInfo,
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
abstract class _$$TipsDateSpotStateImplCopyWith<$Res>
    implements $TipsDateSpotStateCopyWith<$Res> {
  factory _$$TipsDateSpotStateImplCopyWith(_$TipsDateSpotStateImpl value,
          $Res Function(_$TipsDateSpotStateImpl) then) =
      __$$TipsDateSpotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<ContentResponse>> content,
      LoggedInUserInfo userInfo,
      Either<UIError, UISuccess>? errorOrSuccess});

  @override
  $LoggedInUserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$TipsDateSpotStateImplCopyWithImpl<$Res>
    extends _$TipsDateSpotStateCopyWithImpl<$Res, _$TipsDateSpotStateImpl>
    implements _$$TipsDateSpotStateImplCopyWith<$Res> {
  __$$TipsDateSpotStateImplCopyWithImpl(_$TipsDateSpotStateImpl _value,
      $Res Function(_$TipsDateSpotStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? userInfo = null,
    Object? errorOrSuccess = freezed,
  }) {
    return _then(_$TipsDateSpotStateImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContentResponse>>,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as LoggedInUserInfo,
      errorOrSuccess: freezed == errorOrSuccess
          ? _value.errorOrSuccess
          : errorOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<UIError, UISuccess>?,
    ));
  }
}

/// @nodoc

class _$TipsDateSpotStateImpl extends _TipsDateSpotState {
  const _$TipsDateSpotStateImpl(
      {required final Map<String, List<ContentResponse>> content,
      required this.userInfo,
      required this.errorOrSuccess})
      : _content = content,
        super._();

  final Map<String, List<ContentResponse>> _content;
  @override
  Map<String, List<ContentResponse>> get content {
    if (_content is EqualUnmodifiableMapView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_content);
  }

  @override
  final LoggedInUserInfo userInfo;
  @override
  final Either<UIError, UISuccess>? errorOrSuccess;

  @override
  String toString() {
    return 'TipsDateSpotState(content: $content, userInfo: $userInfo, errorOrSuccess: $errorOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipsDateSpotStateImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.errorOrSuccess, errorOrSuccess) ||
                other.errorOrSuccess == errorOrSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_content), userInfo, errorOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TipsDateSpotStateImplCopyWith<_$TipsDateSpotStateImpl> get copyWith =>
      __$$TipsDateSpotStateImplCopyWithImpl<_$TipsDateSpotStateImpl>(
          this, _$identity);
}

abstract class _TipsDateSpotState extends TipsDateSpotState {
  const factory _TipsDateSpotState(
          {required final Map<String, List<ContentResponse>> content,
          required final LoggedInUserInfo userInfo,
          required final Either<UIError, UISuccess>? errorOrSuccess}) =
      _$TipsDateSpotStateImpl;
  const _TipsDateSpotState._() : super._();

  @override
  Map<String, List<ContentResponse>> get content;
  @override
  LoggedInUserInfo get userInfo;
  @override
  Either<UIError, UISuccess>? get errorOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$TipsDateSpotStateImplCopyWith<_$TipsDateSpotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
