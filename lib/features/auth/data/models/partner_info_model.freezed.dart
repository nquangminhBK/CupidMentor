// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PartnerInfoModel _$PartnerInfoModelFromJson(Map<String, dynamic> json) {
  return _PartnerInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PartnerInfoModel {
  @JsonKey(name: 'gender')
  String? get genderRaw => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'birthday')
  String get birthdayRaw => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  List<String> get hobbies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerInfoModelCopyWith<PartnerInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerInfoModelCopyWith<$Res> {
  factory $PartnerInfoModelCopyWith(
          PartnerInfoModel value, $Res Function(PartnerInfoModel) then) =
      _$PartnerInfoModelCopyWithImpl<$Res, PartnerInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gender') String? genderRaw,
      String name,
      @JsonKey(name: 'birthday') String birthdayRaw,
      String job,
      List<String> hobbies});
}

/// @nodoc
class _$PartnerInfoModelCopyWithImpl<$Res, $Val extends PartnerInfoModel>
    implements $PartnerInfoModelCopyWith<$Res> {
  _$PartnerInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderRaw = freezed,
    Object? name = null,
    Object? birthdayRaw = null,
    Object? job = null,
    Object? hobbies = null,
  }) {
    return _then(_value.copyWith(
      genderRaw: freezed == genderRaw
          ? _value.genderRaw
          : genderRaw // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$PartnerInfoModelImplCopyWith<$Res>
    implements $PartnerInfoModelCopyWith<$Res> {
  factory _$$PartnerInfoModelImplCopyWith(_$PartnerInfoModelImpl value,
          $Res Function(_$PartnerInfoModelImpl) then) =
      __$$PartnerInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gender') String? genderRaw,
      String name,
      @JsonKey(name: 'birthday') String birthdayRaw,
      String job,
      List<String> hobbies});
}

/// @nodoc
class __$$PartnerInfoModelImplCopyWithImpl<$Res>
    extends _$PartnerInfoModelCopyWithImpl<$Res, _$PartnerInfoModelImpl>
    implements _$$PartnerInfoModelImplCopyWith<$Res> {
  __$$PartnerInfoModelImplCopyWithImpl(_$PartnerInfoModelImpl _value,
      $Res Function(_$PartnerInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderRaw = freezed,
    Object? name = null,
    Object? birthdayRaw = null,
    Object? job = null,
    Object? hobbies = null,
  }) {
    return _then(_$PartnerInfoModelImpl(
      genderRaw: freezed == genderRaw
          ? _value.genderRaw
          : genderRaw // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$PartnerInfoModelImpl extends _PartnerInfoModel {
  const _$PartnerInfoModelImpl(
      {@JsonKey(name: 'gender') required this.genderRaw,
      required this.name,
      @JsonKey(name: 'birthday') required this.birthdayRaw,
      required this.job,
      required final List<String> hobbies})
      : _hobbies = hobbies,
        super._();

  factory _$PartnerInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartnerInfoModelImplFromJson(json);

  @override
  @JsonKey(name: 'gender')
  final String? genderRaw;
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
    return 'PartnerInfoModel(genderRaw: $genderRaw, name: $name, birthdayRaw: $birthdayRaw, job: $job, hobbies: $hobbies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerInfoModelImpl &&
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
  _$$PartnerInfoModelImplCopyWith<_$PartnerInfoModelImpl> get copyWith =>
      __$$PartnerInfoModelImplCopyWithImpl<_$PartnerInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartnerInfoModelImplToJson(
      this,
    );
  }
}

abstract class _PartnerInfoModel extends PartnerInfoModel {
  const factory _PartnerInfoModel(
      {@JsonKey(name: 'gender') required final String? genderRaw,
      required final String name,
      @JsonKey(name: 'birthday') required final String birthdayRaw,
      required final String job,
      required final List<String> hobbies}) = _$PartnerInfoModelImpl;
  const _PartnerInfoModel._() : super._();

  factory _PartnerInfoModel.fromJson(Map<String, dynamic> json) =
      _$PartnerInfoModelImpl.fromJson;

  @override
  @JsonKey(name: 'gender')
  String? get genderRaw;
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
  _$$PartnerInfoModelImplCopyWith<_$PartnerInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
