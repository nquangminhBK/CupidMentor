// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_with_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentWithImageModel _$ContentWithImageModelFromJson(
    Map<String, dynamic> json) {
  return _ContentWithImageModel.fromJson(json);
}

/// @nodoc
mixin _$ContentWithImageModel {
  String get id => throw _privateConstructorUsedError;
  LocalizationContent get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentWithImageModelCopyWith<ContentWithImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentWithImageModelCopyWith<$Res> {
  factory $ContentWithImageModelCopyWith(ContentWithImageModel value,
          $Res Function(ContentWithImageModel) then) =
      _$ContentWithImageModelCopyWithImpl<$Res, ContentWithImageModel>;
  @useResult
  $Res call({String id, LocalizationContent title, String image});

  $LocalizationContentCopyWith<$Res> get title;
}

/// @nodoc
class _$ContentWithImageModelCopyWithImpl<$Res,
        $Val extends ContentWithImageModel>
    implements $ContentWithImageModelCopyWith<$Res> {
  _$ContentWithImageModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ContentWithImageModelImplCopyWith<$Res>
    implements $ContentWithImageModelCopyWith<$Res> {
  factory _$$ContentWithImageModelImplCopyWith(
          _$ContentWithImageModelImpl value,
          $Res Function(_$ContentWithImageModelImpl) then) =
      __$$ContentWithImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LocalizationContent title, String image});

  @override
  $LocalizationContentCopyWith<$Res> get title;
}

/// @nodoc
class __$$ContentWithImageModelImplCopyWithImpl<$Res>
    extends _$ContentWithImageModelCopyWithImpl<$Res,
        _$ContentWithImageModelImpl>
    implements _$$ContentWithImageModelImplCopyWith<$Res> {
  __$$ContentWithImageModelImplCopyWithImpl(_$ContentWithImageModelImpl _value,
      $Res Function(_$ContentWithImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_$ContentWithImageModelImpl(
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
@JsonSerializable()
class _$ContentWithImageModelImpl extends _ContentWithImageModel {
  const _$ContentWithImageModelImpl(
      {required this.id, required this.title, required this.image})
      : super._();

  factory _$ContentWithImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentWithImageModelImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizationContent title;
  @override
  final String image;

  @override
  String toString() {
    return 'ContentWithImageModel(id: $id, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentWithImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentWithImageModelImplCopyWith<_$ContentWithImageModelImpl>
      get copyWith => __$$ContentWithImageModelImplCopyWithImpl<
          _$ContentWithImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentWithImageModelImplToJson(
      this,
    );
  }
}

abstract class _ContentWithImageModel extends ContentWithImageModel {
  const factory _ContentWithImageModel(
      {required final String id,
      required final LocalizationContent title,
      required final String image}) = _$ContentWithImageModelImpl;
  const _ContentWithImageModel._() : super._();

  factory _ContentWithImageModel.fromJson(Map<String, dynamic> json) =
      _$ContentWithImageModelImpl.fromJson;

  @override
  String get id;
  @override
  LocalizationContent get title;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$ContentWithImageModelImplCopyWith<_$ContentWithImageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
