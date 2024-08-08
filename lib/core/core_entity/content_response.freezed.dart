// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentResponse {
  String get content => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentResponseCopyWith<ContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentResponseCopyWith<$Res> {
  factory $ContentResponseCopyWith(
          ContentResponse value, $Res Function(ContentResponse) then) =
      _$ContentResponseCopyWithImpl<$Res, ContentResponse>;
  @useResult
  $Res call({String content, DateTime createdDate, String id});
}

/// @nodoc
class _$ContentResponseCopyWithImpl<$Res, $Val extends ContentResponse>
    implements $ContentResponseCopyWith<$Res> {
  _$ContentResponseCopyWithImpl(this._value, this._then);

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
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentResponseImplCopyWith<$Res>
    implements $ContentResponseCopyWith<$Res> {
  factory _$$ContentResponseImplCopyWith(_$ContentResponseImpl value,
          $Res Function(_$ContentResponseImpl) then) =
      __$$ContentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, DateTime createdDate, String id});
}

/// @nodoc
class __$$ContentResponseImplCopyWithImpl<$Res>
    extends _$ContentResponseCopyWithImpl<$Res, _$ContentResponseImpl>
    implements _$$ContentResponseImplCopyWith<$Res> {
  __$$ContentResponseImplCopyWithImpl(
      _$ContentResponseImpl _value, $Res Function(_$ContentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? createdDate = null,
    Object? id = null,
  }) {
    return _then(_$ContentResponseImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContentResponseImpl extends _ContentResponse {
  const _$ContentResponseImpl(
      {required this.content, required this.createdDate, required this.id})
      : super._();

  @override
  final String content;
  @override
  final DateTime createdDate;
  @override
  final String id;

  @override
  String toString() {
    return 'ContentResponse(content: $content, createdDate: $createdDate, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentResponseImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, createdDate, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentResponseImplCopyWith<_$ContentResponseImpl> get copyWith =>
      __$$ContentResponseImplCopyWithImpl<_$ContentResponseImpl>(
          this, _$identity);
}

abstract class _ContentResponse extends ContentResponse {
  const factory _ContentResponse(
      {required final String content,
      required final DateTime createdDate,
      required final String id}) = _$ContentResponseImpl;
  const _ContentResponse._() : super._();

  @override
  String get content;
  @override
  DateTime get createdDate;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ContentResponseImplCopyWith<_$ContentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
