// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'self_improvement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelfImprovementModel _$SelfImprovementModelFromJson(Map<String, dynamic> json) {
  return _SelfImprovementModel.fromJson(json);
}

/// @nodoc
mixin _$SelfImprovementModel {
  ContentWithImageModel get category => throw _privateConstructorUsedError;
  List<ContentWithDescriptionModel> get tips =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelfImprovementModelCopyWith<SelfImprovementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfImprovementModelCopyWith<$Res> {
  factory $SelfImprovementModelCopyWith(SelfImprovementModel value,
          $Res Function(SelfImprovementModel) then) =
      _$SelfImprovementModelCopyWithImpl<$Res, SelfImprovementModel>;
  @useResult
  $Res call(
      {ContentWithImageModel category, List<ContentWithDescriptionModel> tips});

  $ContentWithImageModelCopyWith<$Res> get category;
}

/// @nodoc
class _$SelfImprovementModelCopyWithImpl<$Res,
        $Val extends SelfImprovementModel>
    implements $SelfImprovementModelCopyWith<$Res> {
  _$SelfImprovementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? tips = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ContentWithImageModel,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<ContentWithDescriptionModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentWithImageModelCopyWith<$Res> get category {
    return $ContentWithImageModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SelfImprovementModelImplCopyWith<$Res>
    implements $SelfImprovementModelCopyWith<$Res> {
  factory _$$SelfImprovementModelImplCopyWith(_$SelfImprovementModelImpl value,
          $Res Function(_$SelfImprovementModelImpl) then) =
      __$$SelfImprovementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ContentWithImageModel category, List<ContentWithDescriptionModel> tips});

  @override
  $ContentWithImageModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$SelfImprovementModelImplCopyWithImpl<$Res>
    extends _$SelfImprovementModelCopyWithImpl<$Res, _$SelfImprovementModelImpl>
    implements _$$SelfImprovementModelImplCopyWith<$Res> {
  __$$SelfImprovementModelImplCopyWithImpl(_$SelfImprovementModelImpl _value,
      $Res Function(_$SelfImprovementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? tips = null,
  }) {
    return _then(_$SelfImprovementModelImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ContentWithImageModel,
      tips: null == tips
          ? _value._tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<ContentWithDescriptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelfImprovementModelImpl extends _SelfImprovementModel {
  const _$SelfImprovementModelImpl(
      {required this.category,
      required final List<ContentWithDescriptionModel> tips})
      : _tips = tips,
        super._();

  factory _$SelfImprovementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelfImprovementModelImplFromJson(json);

  @override
  final ContentWithImageModel category;
  final List<ContentWithDescriptionModel> _tips;
  @override
  List<ContentWithDescriptionModel> get tips {
    if (_tips is EqualUnmodifiableListView) return _tips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tips);
  }

  @override
  String toString() {
    return 'SelfImprovementModel(category: $category, tips: $tips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelfImprovementModelImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tips, _tips));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_tips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelfImprovementModelImplCopyWith<_$SelfImprovementModelImpl>
      get copyWith =>
          __$$SelfImprovementModelImplCopyWithImpl<_$SelfImprovementModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelfImprovementModelImplToJson(
      this,
    );
  }
}

abstract class _SelfImprovementModel extends SelfImprovementModel {
  const factory _SelfImprovementModel(
          {required final ContentWithImageModel category,
          required final List<ContentWithDescriptionModel> tips}) =
      _$SelfImprovementModelImpl;
  const _SelfImprovementModel._() : super._();

  factory _SelfImprovementModel.fromJson(Map<String, dynamic> json) =
      _$SelfImprovementModelImpl.fromJson;

  @override
  ContentWithImageModel get category;
  @override
  List<ContentWithDescriptionModel> get tips;
  @override
  @JsonKey(ignore: true)
  _$$SelfImprovementModelImplCopyWith<_$SelfImprovementModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
