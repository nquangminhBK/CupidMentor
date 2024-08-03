// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tip_replying_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TipsReplyingState {
  List<Message> get content => throw _privateConstructorUsedError;
  bool? get loading => throw _privateConstructorUsedError;
  bool? get showReload => throw _privateConstructorUsedError;
  Either<UIError, UISuccess>? get errorOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TipsReplyingStateCopyWith<TipsReplyingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsReplyingStateCopyWith<$Res> {
  factory $TipsReplyingStateCopyWith(
          TipsReplyingState value, $Res Function(TipsReplyingState) then) =
      _$TipsReplyingStateCopyWithImpl<$Res, TipsReplyingState>;
  @useResult
  $Res call(
      {List<Message> content,
      bool? loading,
      bool? showReload,
      Either<UIError, UISuccess>? errorOrSuccess});
}

/// @nodoc
class _$TipsReplyingStateCopyWithImpl<$Res, $Val extends TipsReplyingState>
    implements $TipsReplyingStateCopyWith<$Res> {
  _$TipsReplyingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? loading = freezed,
    Object? showReload = freezed,
    Object? errorOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
      showReload: freezed == showReload
          ? _value.showReload
          : showReload // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorOrSuccess: freezed == errorOrSuccess
          ? _value.errorOrSuccess
          : errorOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<UIError, UISuccess>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipsReplyingStateImplCopyWith<$Res>
    implements $TipsReplyingStateCopyWith<$Res> {
  factory _$$TipsReplyingStateImplCopyWith(_$TipsReplyingStateImpl value,
          $Res Function(_$TipsReplyingStateImpl) then) =
      __$$TipsReplyingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Message> content,
      bool? loading,
      bool? showReload,
      Either<UIError, UISuccess>? errorOrSuccess});
}

/// @nodoc
class __$$TipsReplyingStateImplCopyWithImpl<$Res>
    extends _$TipsReplyingStateCopyWithImpl<$Res, _$TipsReplyingStateImpl>
    implements _$$TipsReplyingStateImplCopyWith<$Res> {
  __$$TipsReplyingStateImplCopyWithImpl(_$TipsReplyingStateImpl _value,
      $Res Function(_$TipsReplyingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? loading = freezed,
    Object? showReload = freezed,
    Object? errorOrSuccess = freezed,
  }) {
    return _then(_$TipsReplyingStateImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool?,
      showReload: freezed == showReload
          ? _value.showReload
          : showReload // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorOrSuccess: freezed == errorOrSuccess
          ? _value.errorOrSuccess
          : errorOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<UIError, UISuccess>?,
    ));
  }
}

/// @nodoc

class _$TipsReplyingStateImpl extends _TipsReplyingState {
  const _$TipsReplyingStateImpl(
      {required final List<Message> content,
      this.loading,
      this.showReload,
      required this.errorOrSuccess})
      : _content = content,
        super._();

  final List<Message> _content;
  @override
  List<Message> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final bool? loading;
  @override
  final bool? showReload;
  @override
  final Either<UIError, UISuccess>? errorOrSuccess;

  @override
  String toString() {
    return 'TipsReplyingState(content: $content, loading: $loading, showReload: $showReload, errorOrSuccess: $errorOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipsReplyingStateImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.showReload, showReload) ||
                other.showReload == showReload) &&
            (identical(other.errorOrSuccess, errorOrSuccess) ||
                other.errorOrSuccess == errorOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_content),
      loading,
      showReload,
      errorOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TipsReplyingStateImplCopyWith<_$TipsReplyingStateImpl> get copyWith =>
      __$$TipsReplyingStateImplCopyWithImpl<_$TipsReplyingStateImpl>(
          this, _$identity);
}

abstract class _TipsReplyingState extends TipsReplyingState {
  const factory _TipsReplyingState(
          {required final List<Message> content,
          final bool? loading,
          final bool? showReload,
          required final Either<UIError, UISuccess>? errorOrSuccess}) =
      _$TipsReplyingStateImpl;
  const _TipsReplyingState._() : super._();

  @override
  List<Message> get content;
  @override
  bool? get loading;
  @override
  bool? get showReload;
  @override
  Either<UIError, UISuccess>? get errorOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$TipsReplyingStateImplCopyWith<_$TipsReplyingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
