// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_with_description_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentWithDescriptionModel _$ContentWithDescriptionModelFromJson(
    Map<String, dynamic> json) {
  return _ContentWithDescriptionModel.fromJson(json);
}

/// @nodoc
mixin _$ContentWithDescriptionModel {
  String get id => throw _privateConstructorUsedError;
  LocalizationContent get title => throw _privateConstructorUsedError;
  LocalizationContent get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentWithDescriptionModelCopyWith<ContentWithDescriptionModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentWithDescriptionModelCopyWith<$Res> {
  factory $ContentWithDescriptionModelCopyWith(
          ContentWithDescriptionModel value,
          $Res Function(ContentWithDescriptionModel) then) =
      _$ContentWithDescriptionModelCopyWithImpl<$Res,
          ContentWithDescriptionModel>;
  @useResult
  $Res call(
      {String id, LocalizationContent title, LocalizationContent description});

  $LocalizationContentCopyWith<$Res> get title;
  $LocalizationContentCopyWith<$Res> get description;
}

/// @nodoc
class _$ContentWithDescriptionModelCopyWithImpl<$Res,
        $Val extends ContentWithDescriptionModel>
    implements $ContentWithDescriptionModelCopyWith<$Res> {
  _$ContentWithDescriptionModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ContentWithDescriptionModelImplCopyWith<$Res>
    implements $ContentWithDescriptionModelCopyWith<$Res> {
  factory _$$ContentWithDescriptionModelImplCopyWith(
          _$ContentWithDescriptionModelImpl value,
          $Res Function(_$ContentWithDescriptionModelImpl) then) =
      __$$ContentWithDescriptionModelImplCopyWithImpl<$Res>;
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
class __$$ContentWithDescriptionModelImplCopyWithImpl<$Res>
    extends _$ContentWithDescriptionModelCopyWithImpl<$Res,
        _$ContentWithDescriptionModelImpl>
    implements _$$ContentWithDescriptionModelImplCopyWith<$Res> {
  __$$ContentWithDescriptionModelImplCopyWithImpl(
      _$ContentWithDescriptionModelImpl _value,
      $Res Function(_$ContentWithDescriptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$ContentWithDescriptionModelImpl(
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
@JsonSerializable()
class _$ContentWithDescriptionModelImpl extends _ContentWithDescriptionModel {
  const _$ContentWithDescriptionModelImpl(
      {required this.id, required this.title, required this.description})
      : super._();

  factory _$ContentWithDescriptionModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ContentWithDescriptionModelImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizationContent title;
  @override
  final LocalizationContent description;

  @override
  String toString() {
    return 'ContentWithDescriptionModel(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentWithDescriptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentWithDescriptionModelImplCopyWith<_$ContentWithDescriptionModelImpl>
      get copyWith => __$$ContentWithDescriptionModelImplCopyWithImpl<
          _$ContentWithDescriptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentWithDescriptionModelImplToJson(
      this,
    );
  }
}

abstract class _ContentWithDescriptionModel
    extends ContentWithDescriptionModel {
  const factory _ContentWithDescriptionModel(
          {required final String id,
          required final LocalizationContent title,
          required final LocalizationContent description}) =
      _$ContentWithDescriptionModelImpl;
  const _ContentWithDescriptionModel._() : super._();

  factory _ContentWithDescriptionModel.fromJson(Map<String, dynamic> json) =
      _$ContentWithDescriptionModelImpl.fromJson;

  @override
  String get id;
  @override
  LocalizationContent get title;
  @override
  LocalizationContent get description;
  @override
  @JsonKey(ignore: true)
  _$$ContentWithDescriptionModelImplCopyWith<_$ContentWithDescriptionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
