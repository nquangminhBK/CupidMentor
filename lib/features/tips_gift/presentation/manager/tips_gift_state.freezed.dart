// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tips_gift_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TipsGiftState {
  Map<String, List<ContentResponse>> get content =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TipsGiftStateCopyWith<TipsGiftState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsGiftStateCopyWith<$Res> {
  factory $TipsGiftStateCopyWith(
          TipsGiftState value, $Res Function(TipsGiftState) then) =
      _$TipsGiftStateCopyWithImpl<$Res, TipsGiftState>;
  @useResult
  $Res call({Map<String, List<ContentResponse>> content});
}

/// @nodoc
class _$TipsGiftStateCopyWithImpl<$Res, $Val extends TipsGiftState>
    implements $TipsGiftStateCopyWith<$Res> {
  _$TipsGiftStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContentResponse>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipsGiftStateImplCopyWith<$Res>
    implements $TipsGiftStateCopyWith<$Res> {
  factory _$$TipsGiftStateImplCopyWith(
          _$TipsGiftStateImpl value, $Res Function(_$TipsGiftStateImpl) then) =
      __$$TipsGiftStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<ContentResponse>> content});
}

/// @nodoc
class __$$TipsGiftStateImplCopyWithImpl<$Res>
    extends _$TipsGiftStateCopyWithImpl<$Res, _$TipsGiftStateImpl>
    implements _$$TipsGiftStateImplCopyWith<$Res> {
  __$$TipsGiftStateImplCopyWithImpl(
      _$TipsGiftStateImpl _value, $Res Function(_$TipsGiftStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$TipsGiftStateImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, List<ContentResponse>>,
    ));
  }
}

/// @nodoc

class _$TipsGiftStateImpl extends _TipsGiftState {
  const _$TipsGiftStateImpl(
      {required final Map<String, List<ContentResponse>> content})
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
  String toString() {
    return 'TipsGiftState(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipsGiftStateImpl &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_content));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TipsGiftStateImplCopyWith<_$TipsGiftStateImpl> get copyWith =>
      __$$TipsGiftStateImplCopyWithImpl<_$TipsGiftStateImpl>(this, _$identity);
}

abstract class _TipsGiftState extends TipsGiftState {
  const factory _TipsGiftState(
          {required final Map<String, List<ContentResponse>> content}) =
      _$TipsGiftStateImpl;
  const _TipsGiftState._() : super._();

  @override
  Map<String, List<ContentResponse>> get content;
  @override
  @JsonKey(ignore: true)
  _$$TipsGiftStateImplCopyWith<_$TipsGiftStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
