// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoggedInUserInfo {
  Gender get gender => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  DateTime get birthday => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  List<String> get personalities => throw _privateConstructorUsedError;
  List<String> get hobbies => throw _privateConstructorUsedError;
  List<String> get loveLanguages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoggedInUserInfoCopyWith<LoggedInUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInUserInfoCopyWith<$Res> {
  factory $LoggedInUserInfoCopyWith(
          LoggedInUserInfo value, $Res Function(LoggedInUserInfo) then) =
      _$LoggedInUserInfoCopyWithImpl<$Res, LoggedInUserInfo>;
  @useResult
  $Res call(
      {Gender gender,
      String name,
      String avatar,
      DateTime birthday,
      String job,
      List<String> personalities,
      List<String> hobbies,
      List<String> loveLanguages});
}

/// @nodoc
class _$LoggedInUserInfoCopyWithImpl<$Res, $Val extends LoggedInUserInfo>
    implements $LoggedInUserInfoCopyWith<$Res> {
  _$LoggedInUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = null,
    Object? name = null,
    Object? avatar = null,
    Object? birthday = null,
    Object? job = null,
    Object? personalities = null,
    Object? hobbies = null,
    Object? loveLanguages = null,
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
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      personalities: null == personalities
          ? _value.personalities
          : personalities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hobbies: null == hobbies
          ? _value.hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loveLanguages: null == loveLanguages
          ? _value.loveLanguages
          : loveLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoggedInUserInfoImplCopyWith<$Res>
    implements $LoggedInUserInfoCopyWith<$Res> {
  factory _$$LoggedInUserInfoImplCopyWith(_$LoggedInUserInfoImpl value,
          $Res Function(_$LoggedInUserInfoImpl) then) =
      __$$LoggedInUserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Gender gender,
      String name,
      String avatar,
      DateTime birthday,
      String job,
      List<String> personalities,
      List<String> hobbies,
      List<String> loveLanguages});
}

/// @nodoc
class __$$LoggedInUserInfoImplCopyWithImpl<$Res>
    extends _$LoggedInUserInfoCopyWithImpl<$Res, _$LoggedInUserInfoImpl>
    implements _$$LoggedInUserInfoImplCopyWith<$Res> {
  __$$LoggedInUserInfoImplCopyWithImpl(_$LoggedInUserInfoImpl _value,
      $Res Function(_$LoggedInUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = null,
    Object? name = null,
    Object? avatar = null,
    Object? birthday = null,
    Object? job = null,
    Object? personalities = null,
    Object? hobbies = null,
    Object? loveLanguages = null,
  }) {
    return _then(_$LoggedInUserInfoImpl(
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      personalities: null == personalities
          ? _value._personalities
          : personalities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hobbies: null == hobbies
          ? _value._hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      loveLanguages: null == loveLanguages
          ? _value._loveLanguages
          : loveLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$LoggedInUserInfoImpl extends _LoggedInUserInfo {
  const _$LoggedInUserInfoImpl(
      {required this.gender,
      required this.name,
      required this.avatar,
      required this.birthday,
      required this.job,
      required final List<String> personalities,
      required final List<String> hobbies,
      required final List<String> loveLanguages})
      : _personalities = personalities,
        _hobbies = hobbies,
        _loveLanguages = loveLanguages,
        super._();

  @override
  final Gender gender;
  @override
  final String name;
  @override
  final String avatar;
  @override
  final DateTime birthday;
  @override
  final String job;
  final List<String> _personalities;
  @override
  List<String> get personalities {
    if (_personalities is EqualUnmodifiableListView) return _personalities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personalities);
  }

  final List<String> _hobbies;
  @override
  List<String> get hobbies {
    if (_hobbies is EqualUnmodifiableListView) return _hobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hobbies);
  }

  final List<String> _loveLanguages;
  @override
  List<String> get loveLanguages {
    if (_loveLanguages is EqualUnmodifiableListView) return _loveLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loveLanguages);
  }

  @override
  String toString() {
    return 'LoggedInUserInfo(gender: $gender, name: $name, avatar: $avatar, birthday: $birthday, job: $job, personalities: $personalities, hobbies: $hobbies, loveLanguages: $loveLanguages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedInUserInfoImpl &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.job, job) || other.job == job) &&
            const DeepCollectionEquality()
                .equals(other._personalities, _personalities) &&
            const DeepCollectionEquality().equals(other._hobbies, _hobbies) &&
            const DeepCollectionEquality()
                .equals(other._loveLanguages, _loveLanguages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      gender,
      name,
      avatar,
      birthday,
      job,
      const DeepCollectionEquality().hash(_personalities),
      const DeepCollectionEquality().hash(_hobbies),
      const DeepCollectionEquality().hash(_loveLanguages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInUserInfoImplCopyWith<_$LoggedInUserInfoImpl> get copyWith =>
      __$$LoggedInUserInfoImplCopyWithImpl<_$LoggedInUserInfoImpl>(
          this, _$identity);
}

abstract class _LoggedInUserInfo extends LoggedInUserInfo {
  const factory _LoggedInUserInfo(
      {required final Gender gender,
      required final String name,
      required final String avatar,
      required final DateTime birthday,
      required final String job,
      required final List<String> personalities,
      required final List<String> hobbies,
      required final List<String> loveLanguages}) = _$LoggedInUserInfoImpl;
  const _LoggedInUserInfo._() : super._();

  @override
  Gender get gender;
  @override
  String get name;
  @override
  String get avatar;
  @override
  DateTime get birthday;
  @override
  String get job;
  @override
  List<String> get personalities;
  @override
  List<String> get hobbies;
  @override
  List<String> get loveLanguages;
  @override
  @JsonKey(ignore: true)
  _$$LoggedInUserInfoImplCopyWith<_$LoggedInUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
