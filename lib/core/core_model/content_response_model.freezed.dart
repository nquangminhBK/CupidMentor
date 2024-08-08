// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentResponseModel _$ContentResponseModelFromJson(Map<String, dynamic> json) {
  return _ContentResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ContentResponseModel {
  String get content => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentResponseModelCopyWith<ContentResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentResponseModelCopyWith<$Res> {
  factory $ContentResponseModelCopyWith(ContentResponseModel value,
          $Res Function(ContentResponseModel) then) =
      _$ContentResponseModelCopyWithImpl<$Res, ContentResponseModel>;
  @useResult
  $Res call({String content, String createdDate, String id});
}

/// @nodoc
class _$ContentResponseModelCopyWithImpl<$Res,
        $Val extends ContentResponseModel>
    implements $ContentResponseModelCopyWith<$Res> {
  _$ContentResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? createdDate = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentResponseModelImplCopyWith<$Res>
    implements $ContentResponseModelCopyWith<$Res> {
  factory _$$ContentResponseModelImplCopyWith(_$ContentResponseModelImpl value,
          $Res Function(_$ContentResponseModelImpl) then) =
      __$$ContentResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String createdDate, String id});
}

/// @nodoc
class __$$ContentResponseModelImplCopyWithImpl<$Res>
    extends _$ContentResponseModelCopyWithImpl<$Res, _$ContentResponseModelImpl>
    implements _$$ContentResponseModelImplCopyWith<$Res> {
  __$$ContentResponseModelImplCopyWithImpl(_$ContentResponseModelImpl _value,
      $Res Function(_$ContentResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? createdDate = null,
    Object? id = null,
  }) {
    return _then(_$ContentResponseModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentResponseModelImpl extends _ContentResponseModel {
  const _$ContentResponseModelImpl(
      {required this.content, required this.createdDate, required this.id})
      : super._();

  factory _$ContentResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentResponseModelImplFromJson(json);

  @override
  final String content;
  @override
  final String createdDate;
  @override
  final String id;

  @override
  String toString() {
    return 'ContentResponseModel(content: $content, createdDate: $createdDate, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentResponseModelImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, createdDate, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentResponseModelImplCopyWith<_$ContentResponseModelImpl>
      get copyWith =>
          __$$ContentResponseModelImplCopyWithImpl<_$ContentResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ContentResponseModel extends ContentResponseModel {
  const factory _ContentResponseModel(
      {required final String content,
      required final String createdDate,
      required final String id}) = _$ContentResponseModelImpl;
  const _ContentResponseModel._() : super._();

  factory _ContentResponseModel.fromJson(Map<String, dynamic> json) =
      _$ContentResponseModelImpl.fromJson;

  @override
  String get content;
  @override
  String get createdDate;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ContentResponseModelImplCopyWith<_$ContentResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
