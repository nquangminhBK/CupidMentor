// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_with_description.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentWithDescription {
  String get id => throw _privateConstructorUsedError;
  LocalizationContent get title => throw _privateConstructorUsedError;
  LocalizationContent get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentWithDescriptionCopyWith<ContentWithDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentWithDescriptionCopyWith<$Res> {
  factory $ContentWithDescriptionCopyWith(ContentWithDescription value,
          $Res Function(ContentWithDescription) then) =
      _$ContentWithDescriptionCopyWithImpl<$Res, ContentWithDescription>;
  @useResult
  $Res call(
      {String id, LocalizationContent title, LocalizationContent description});

  $LocalizationContentCopyWith<$Res> get title;
  $LocalizationContentCopyWith<$Res> get description;
}

/// @nodoc
class _$ContentWithDescriptionCopyWithImpl<$Res,
        $Val extends ContentWithDescription>
    implements $ContentWithDescriptionCopyWith<$Res> {
  _$ContentWithDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as LocalizationContent,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LocalizationContent,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizationContentCopyWith<$Res> get title {
    return $LocalizationContentCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizationContentCopyWith<$Res> get description {
    return $LocalizationContentCopyWith<$Res>(_value.description, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentWithDescriptionImplCopyWith<$Res>
    implements $ContentWithDescriptionCopyWith<$Res> {
  factory _$$ContentWithDescriptionImplCopyWith(
          _$ContentWithDescriptionImpl value,
          $Res Function(_$ContentWithDescriptionImpl) then) =
      __$$ContentWithDescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, LocalizationContent title, LocalizationContent description});

  @override
  $LocalizationContentCopyWith<$Res> get title;
  @override
  $LocalizationContentCopyWith<$Res> get description;
}

/// @nodoc
class __$$ContentWithDescriptionImplCopyWithImpl<$Res>
    extends _$ContentWithDescriptionCopyWithImpl<$Res,
        _$ContentWithDescriptionImpl>
    implements _$$ContentWithDescriptionImplCopyWith<$Res> {
  __$$ContentWithDescriptionImplCopyWithImpl(
      _$ContentWithDescriptionImpl _value,
      $Res Function(_$ContentWithDescriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$ContentWithDescriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as LocalizationContent,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as LocalizationContent,
    ));
  }
}

/// @nodoc

class _$ContentWithDescriptionImpl extends _ContentWithDescription {
  const _$ContentWithDescriptionImpl(
      {required this.id, required this.title, required this.description})
      : super._();

  @override
  final String id;
  @override
  final LocalizationContent title;
  @override
  final LocalizationContent description;

  @override
  String toString() {
    return 'ContentWithDescription(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentWithDescriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentWithDescriptionImplCopyWith<_$ContentWithDescriptionImpl>
      get copyWith => __$$ContentWithDescriptionImplCopyWithImpl<
          _$ContentWithDescriptionImpl>(this, _$identity);
}

abstract class _ContentWithDescription extends ContentWithDescription {
  const factory _ContentWithDescription(
          {required final String id,
          required final LocalizationContent title,
          required final LocalizationContent description}) =
      _$ContentWithDescriptionImpl;
  const _ContentWithDescription._() : super._();

  @override
  String get id;
  @override
  LocalizationContent get title;
  @override
  LocalizationContent get description;
  @override
  @JsonKey(ignore: true)
  _$$ContentWithDescriptionImplCopyWith<_$ContentWithDescriptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
