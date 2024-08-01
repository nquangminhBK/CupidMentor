// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_with_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentWithImage {
  String get id => throw _privateConstructorUsedError;
  LocalizationContent get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentWithImageCopyWith<ContentWithImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentWithImageCopyWith<$Res> {
  factory $ContentWithImageCopyWith(
          ContentWithImage value, $Res Function(ContentWithImage) then) =
      _$ContentWithImageCopyWithImpl<$Res, ContentWithImage>;
  @useResult
  $Res call({String id, LocalizationContent title, String image});

  $LocalizationContentCopyWith<$Res> get title;
}

/// @nodoc
class _$ContentWithImageCopyWithImpl<$Res, $Val extends ContentWithImage>
    implements $ContentWithImageCopyWith<$Res> {
  _$ContentWithImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizationContentCopyWith<$Res> get title {
    return $LocalizationContentCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentWithImageImplCopyWith<$Res>
    implements $ContentWithImageCopyWith<$Res> {
  factory _$$ContentWithImageImplCopyWith(_$ContentWithImageImpl value,
          $Res Function(_$ContentWithImageImpl) then) =
      __$$ContentWithImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LocalizationContent title, String image});

  @override
  $LocalizationContentCopyWith<$Res> get title;
}

/// @nodoc
class __$$ContentWithImageImplCopyWithImpl<$Res>
    extends _$ContentWithImageCopyWithImpl<$Res, _$ContentWithImageImpl>
    implements _$$ContentWithImageImplCopyWith<$Res> {
  __$$ContentWithImageImplCopyWithImpl(_$ContentWithImageImpl _value,
      $Res Function(_$ContentWithImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_$ContentWithImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as LocalizationContent,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContentWithImageImpl extends _ContentWithImage {
  const _$ContentWithImageImpl(
      {required this.id, required this.title, required this.image})
      : super._();

  @override
  final String id;
  @override
  final LocalizationContent title;
  @override
  final String image;

  @override
  String toString() {
    return 'ContentWithImage(id: $id, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentWithImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentWithImageImplCopyWith<_$ContentWithImageImpl> get copyWith =>
      __$$ContentWithImageImplCopyWithImpl<_$ContentWithImageImpl>(
          this, _$identity);
}

abstract class _ContentWithImage extends ContentWithImage {
  const factory _ContentWithImage(
      {required final String id,
      required final LocalizationContent title,
      required final String image}) = _$ContentWithImageImpl;
  const _ContentWithImage._() : super._();

  @override
  String get id;
  @override
  LocalizationContent get title;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$ContentWithImageImplCopyWith<_$ContentWithImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
