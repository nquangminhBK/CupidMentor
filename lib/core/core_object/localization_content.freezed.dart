// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalizationContent _$LocalizationContentFromJson(Map<String, dynamic> json) {
  return _LocalizationContent.fromJson(json);
}

/// @nodoc
mixin _$LocalizationContent {
  String? get id => throw _privateConstructorUsedError;
  Map<LocalizationEnum, String> get content =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationContentCopyWith<LocalizationContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationContentCopyWith<$Res> {
  factory $LocalizationContentCopyWith(
          LocalizationContent value, $Res Function(LocalizationContent) then) =
      _$LocalizationContentCopyWithImpl<$Res, LocalizationContent>;
  @useResult
  $Res call({String? id, Map<LocalizationEnum, String> content});
}

/// @nodoc
class _$LocalizationContentCopyWithImpl<$Res, $Val extends LocalizationContent>
    implements $LocalizationContentCopyWith<$Res> {
  _$LocalizationContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<LocalizationEnum, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationContentImplCopyWith<$Res>
    implements $LocalizationContentCopyWith<$Res> {
  factory _$$LocalizationContentImplCopyWith(_$LocalizationContentImpl value,
          $Res Function(_$LocalizationContentImpl) then) =
      __$$LocalizationContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, Map<LocalizationEnum, String> content});
}

/// @nodoc
class __$$LocalizationContentImplCopyWithImpl<$Res>
    extends _$LocalizationContentCopyWithImpl<$Res, _$LocalizationContentImpl>
    implements _$$LocalizationContentImplCopyWith<$Res> {
  __$$LocalizationContentImplCopyWithImpl(_$LocalizationContentImpl _value,
      $Res Function(_$LocalizationContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
  }) {
    return _then(_$LocalizationContentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<LocalizationEnum, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalizationContentImpl extends _LocalizationContent {
  const _$LocalizationContentImpl(
      {this.id, required final Map<LocalizationEnum, String> content})
      : _content = content,
        super._();

  factory _$LocalizationContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizationContentImplFromJson(json);

  @override
  final String? id;
  final Map<LocalizationEnum, String> _content;
  @override
  Map<LocalizationEnum, String> get content {
    if (_content is EqualUnmodifiableMapView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_content);
  }

  @override
  String toString() {
    return 'LocalizationContent(id: $id, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationContentImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_content));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationContentImplCopyWith<_$LocalizationContentImpl> get copyWith =>
      __$$LocalizationContentImplCopyWithImpl<_$LocalizationContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizationContentImplToJson(
      this,
    );
  }
}

abstract class _LocalizationContent extends LocalizationContent {
  const factory _LocalizationContent(
          {final String? id,
          required final Map<LocalizationEnum, String> content}) =
      _$LocalizationContentImpl;
  const _LocalizationContent._() : super._();

  factory _LocalizationContent.fromJson(Map<String, dynamic> json) =
      _$LocalizationContentImpl.fromJson;

  @override
  String? get id;
  @override
  Map<LocalizationEnum, String> get content;
  @override
  @JsonKey(ignore: true)
  _$$LocalizationContentImplCopyWith<_$LocalizationContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
