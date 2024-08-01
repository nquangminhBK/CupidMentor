// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'self_improvement_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelfImprovementEntity {
  ContentWithImage get category => throw _privateConstructorUsedError;
  List<ContentWithDescription> get tips => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelfImprovementEntityCopyWith<SelfImprovementEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfImprovementEntityCopyWith<$Res> {
  factory $SelfImprovementEntityCopyWith(SelfImprovementEntity value,
          $Res Function(SelfImprovementEntity) then) =
      _$SelfImprovementEntityCopyWithImpl<$Res, SelfImprovementEntity>;
  @useResult
  $Res call({ContentWithImage category, List<ContentWithDescription> tips});

  $ContentWithImageCopyWith<$Res> get category;
}

/// @nodoc
class _$SelfImprovementEntityCopyWithImpl<$Res,
        $Val extends SelfImprovementEntity>
    implements $SelfImprovementEntityCopyWith<$Res> {
  _$SelfImprovementEntityCopyWithImpl(this._value, this._then);

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
              as ContentWithImage,
      tips: null == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<ContentWithDescription>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentWithImageCopyWith<$Res> get category {
    return $ContentWithImageCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SelfImprovementEntityImplCopyWith<$Res>
    implements $SelfImprovementEntityCopyWith<$Res> {
  factory _$$SelfImprovementEntityImplCopyWith(
          _$SelfImprovementEntityImpl value,
          $Res Function(_$SelfImprovementEntityImpl) then) =
      __$$SelfImprovementEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContentWithImage category, List<ContentWithDescription> tips});

  @override
  $ContentWithImageCopyWith<$Res> get category;
}

/// @nodoc
class __$$SelfImprovementEntityImplCopyWithImpl<$Res>
    extends _$SelfImprovementEntityCopyWithImpl<$Res,
        _$SelfImprovementEntityImpl>
    implements _$$SelfImprovementEntityImplCopyWith<$Res> {
  __$$SelfImprovementEntityImplCopyWithImpl(_$SelfImprovementEntityImpl _value,
      $Res Function(_$SelfImprovementEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? tips = null,
  }) {
    return _then(_$SelfImprovementEntityImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ContentWithImage,
      tips: null == tips
          ? _value._tips
          : tips // ignore: cast_nullable_to_non_nullable
              as List<ContentWithDescription>,
    ));
  }
}

/// @nodoc

class _$SelfImprovementEntityImpl extends _SelfImprovementEntity {
  const _$SelfImprovementEntityImpl(
      {required this.category,
      required final List<ContentWithDescription> tips})
      : _tips = tips,
        super._();

  @override
  final ContentWithImage category;
  final List<ContentWithDescription> _tips;
  @override
  List<ContentWithDescription> get tips {
    if (_tips is EqualUnmodifiableListView) return _tips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tips);
  }

  @override
  String toString() {
    return 'SelfImprovementEntity(category: $category, tips: $tips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelfImprovementEntityImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tips, _tips));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_tips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelfImprovementEntityImplCopyWith<_$SelfImprovementEntityImpl>
      get copyWith => __$$SelfImprovementEntityImplCopyWithImpl<
          _$SelfImprovementEntityImpl>(this, _$identity);
}

abstract class _SelfImprovementEntity extends SelfImprovementEntity {
  const factory _SelfImprovementEntity(
          {required final ContentWithImage category,
          required final List<ContentWithDescription> tips}) =
      _$SelfImprovementEntityImpl;
  const _SelfImprovementEntity._() : super._();

  @override
  ContentWithImage get category;
  @override
  List<ContentWithDescription> get tips;
  @override
  @JsonKey(ignore: true)
  _$$SelfImprovementEntityImplCopyWith<_$SelfImprovementEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
