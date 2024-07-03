// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crush_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CrushInfo {
  Gender get gender => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get birthday => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  List<String> get hobbies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CrushInfoCopyWith<CrushInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrushInfoCopyWith<$Res> {
  factory $CrushInfoCopyWith(CrushInfo value, $Res Function(CrushInfo) then) =
      _$CrushInfoCopyWithImpl<$Res, CrushInfo>;
  @useResult
  $Res call(
      {Gender gender,
      String name,
      DateTime birthday,
      String job,
      List<String> hobbies});
}

/// @nodoc
class _$CrushInfoCopyWithImpl<$Res, $Val extends CrushInfo>
    implements $CrushInfoCopyWith<$Res> {
  _$CrushInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = null,
    Object? name = null,
    Object? birthday = null,
    Object? job = null,
    Object? hobbies = null,
  }) {
    return _then(_value.copyWith(
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value.hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrushInfoImplCopyWith<$Res>
    implements $CrushInfoCopyWith<$Res> {
  factory _$$CrushInfoImplCopyWith(
          _$CrushInfoImpl value, $Res Function(_$CrushInfoImpl) then) =
      __$$CrushInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Gender gender,
      String name,
      DateTime birthday,
      String job,
      List<String> hobbies});
}

/// @nodoc
class __$$CrushInfoImplCopyWithImpl<$Res>
    extends _$CrushInfoCopyWithImpl<$Res, _$CrushInfoImpl>
    implements _$$CrushInfoImplCopyWith<$Res> {
  __$$CrushInfoImplCopyWithImpl(
      _$CrushInfoImpl _value, $Res Function(_$CrushInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = null,
    Object? name = null,
    Object? birthday = null,
    Object? job = null,
    Object? hobbies = null,
  }) {
    return _then(_$CrushInfoImpl(
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value._hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$CrushInfoImpl extends _CrushInfo {
  const _$CrushInfoImpl(
      {required this.gender,
      required this.name,
      required this.birthday,
      required this.job,
      required final List<String> hobbies})
      : _hobbies = hobbies,
        super._();

  @override
  final Gender gender;
  @override
  final String name;
  @override
  final DateTime birthday;
  @override
  final String job;
  final List<String> _hobbies;
  @override
  List<String> get hobbies {
    if (_hobbies is EqualUnmodifiableListView) return _hobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hobbies);
  }

  @override
  String toString() {
    return 'CrushInfo(gender: $gender, name: $name, birthday: $birthday, job: $job, hobbies: $hobbies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrushInfoImpl &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.job, job) || other.job == job) &&
            const DeepCollectionEquality().equals(other._hobbies, _hobbies));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gender, name, birthday, job,
      const DeepCollectionEquality().hash(_hobbies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrushInfoImplCopyWith<_$CrushInfoImpl> get copyWith =>
      __$$CrushInfoImplCopyWithImpl<_$CrushInfoImpl>(this, _$identity);
}

abstract class _CrushInfo extends CrushInfo {
  const factory _CrushInfo(
      {required final Gender gender,
      required final String name,
      required final DateTime birthday,
      required final String job,
      required final List<String> hobbies}) = _$CrushInfoImpl;
  const _CrushInfo._() : super._();

  @override
  Gender get gender;
  @override
  String get name;
  @override
  DateTime get birthday;
  @override
  String get job;
  @override
  List<String> get hobbies;
  @override
  @JsonKey(ignore: true)
  _$$CrushInfoImplCopyWith<_$CrushInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
