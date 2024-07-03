// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crush_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CrushInfoModel _$CrushInfoModelFromJson(Map<String, dynamic> json) {
  return _CrushInfoModel.fromJson(json);
}

/// @nodoc
mixin _$CrushInfoModel {
  @JsonKey(name: 'gender')
  String get genderRaw => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthday')
  String get birthdayRaw => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  List<String> get hobbies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrushInfoModelCopyWith<CrushInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrushInfoModelCopyWith<$Res> {
  factory $CrushInfoModelCopyWith(
          CrushInfoModel value, $Res Function(CrushInfoModel) then) =
      _$CrushInfoModelCopyWithImpl<$Res, CrushInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gender') String genderRaw,
      String name,
      @JsonKey(name: 'birthday') String birthdayRaw,
      String job,
      List<String> hobbies});
}

/// @nodoc
class _$CrushInfoModelCopyWithImpl<$Res, $Val extends CrushInfoModel>
    implements $CrushInfoModelCopyWith<$Res> {
  _$CrushInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderRaw = null,
    Object? name = null,
    Object? birthdayRaw = null,
    Object? job = null,
    Object? hobbies = null,
  }) {
    return _then(_value.copyWith(
      genderRaw: null == genderRaw
          ? _value.genderRaw
          : genderRaw // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthdayRaw: null == birthdayRaw
          ? _value.birthdayRaw
          : birthdayRaw // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$CrushInfoModelImplCopyWith<$Res>
    implements $CrushInfoModelCopyWith<$Res> {
  factory _$$CrushInfoModelImplCopyWith(_$CrushInfoModelImpl value,
          $Res Function(_$CrushInfoModelImpl) then) =
      __$$CrushInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gender') String genderRaw,
      String name,
      @JsonKey(name: 'birthday') String birthdayRaw,
      String job,
      List<String> hobbies});
}

/// @nodoc
class __$$CrushInfoModelImplCopyWithImpl<$Res>
    extends _$CrushInfoModelCopyWithImpl<$Res, _$CrushInfoModelImpl>
    implements _$$CrushInfoModelImplCopyWith<$Res> {
  __$$CrushInfoModelImplCopyWithImpl(
      _$CrushInfoModelImpl _value, $Res Function(_$CrushInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderRaw = null,
    Object? name = null,
    Object? birthdayRaw = null,
    Object? job = null,
    Object? hobbies = null,
  }) {
    return _then(_$CrushInfoModelImpl(
      genderRaw: null == genderRaw
          ? _value.genderRaw
          : genderRaw // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      birthdayRaw: null == birthdayRaw
          ? _value.birthdayRaw
          : birthdayRaw // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$CrushInfoModelImpl extends _CrushInfoModel {
  const _$CrushInfoModelImpl(
      {@JsonKey(name: 'gender') required this.genderRaw,
      required this.name,
      @JsonKey(name: 'birthday') required this.birthdayRaw,
      required this.job,
      required final List<String> hobbies})
      : _hobbies = hobbies,
        super._();

  factory _$CrushInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrushInfoModelImplFromJson(json);

  @override
  @JsonKey(name: 'gender')
  final String genderRaw;
  @override
  final String name;
  @override
  @JsonKey(name: 'birthday')
  final String birthdayRaw;
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
    return 'CrushInfoModel(genderRaw: $genderRaw, name: $name, birthdayRaw: $birthdayRaw, job: $job, hobbies: $hobbies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrushInfoModelImpl &&
            (identical(other.genderRaw, genderRaw) ||
                other.genderRaw == genderRaw) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthdayRaw, birthdayRaw) ||
                other.birthdayRaw == birthdayRaw) &&
            (identical(other.job, job) || other.job == job) &&
            const DeepCollectionEquality().equals(other._hobbies, _hobbies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, genderRaw, name, birthdayRaw,
      job, const DeepCollectionEquality().hash(_hobbies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrushInfoModelImplCopyWith<_$CrushInfoModelImpl> get copyWith =>
      __$$CrushInfoModelImplCopyWithImpl<_$CrushInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrushInfoModelImplToJson(
      this,
    );
  }
}

abstract class _CrushInfoModel extends CrushInfoModel {
  const factory _CrushInfoModel(
      {@JsonKey(name: 'gender') required final String genderRaw,
      required final String name,
      @JsonKey(name: 'birthday') required final String birthdayRaw,
      required final String job,
      required final List<String> hobbies}) = _$CrushInfoModelImpl;
  const _CrushInfoModel._() : super._();

  factory _CrushInfoModel.fromJson(Map<String, dynamic> json) =
      _$CrushInfoModelImpl.fromJson;

  @override
  @JsonKey(name: 'gender')
  String get genderRaw;
  @override
  String get name;
  @override
  @JsonKey(name: 'birthday')
  String get birthdayRaw;
  @override
  String get job;
  @override
  List<String> get hobbies;
  @override
  @JsonKey(ignore: true)
  _$$CrushInfoModelImplCopyWith<_$CrushInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
