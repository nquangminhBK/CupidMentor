// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalizationState {
  LocalizationEnum get lang => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalizationStateCopyWith<LocalizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationStateCopyWith<$Res> {
  factory $LocalizationStateCopyWith(
          LocalizationState value, $Res Function(LocalizationState) then) =
      _$LocalizationStateCopyWithImpl<$Res, LocalizationState>;
  @useResult
  $Res call({LocalizationEnum lang});
}

/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res, $Val extends LocalizationState>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
  }) {
    return _then(_value.copyWith(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as LocalizationEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationStateImplCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$$LocalizationStateImplCopyWith(_$LocalizationStateImpl value,
          $Res Function(_$LocalizationStateImpl) then) =
      __$$LocalizationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalizationEnum lang});
}

/// @nodoc
class __$$LocalizationStateImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$LocalizationStateImpl>
    implements _$$LocalizationStateImplCopyWith<$Res> {
  __$$LocalizationStateImplCopyWithImpl(_$LocalizationStateImpl _value,
      $Res Function(_$LocalizationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
  }) {
    return _then(_$LocalizationStateImpl(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as LocalizationEnum,
    ));
  }
}

/// @nodoc

class _$LocalizationStateImpl extends _LocalizationState {
  const _$LocalizationStateImpl({required this.lang}) : super._();

  @override
  final LocalizationEnum lang;

  @override
  String toString() {
    return 'LocalizationState(lang: $lang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationStateImpl &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lang);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationStateImplCopyWith<_$LocalizationStateImpl> get copyWith =>
      __$$LocalizationStateImplCopyWithImpl<_$LocalizationStateImpl>(
          this, _$identity);
}

abstract class _LocalizationState extends LocalizationState {
  const factory _LocalizationState({required final LocalizationEnum lang}) =
      _$LocalizationStateImpl;
  const _LocalizationState._() : super._();

  @override
  LocalizationEnum get lang;
  @override
  @JsonKey(ignore: true)
  _$$LocalizationStateImplCopyWith<_$LocalizationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
