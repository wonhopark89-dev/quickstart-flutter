// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Person2 _$Person2FromJson(Map<String, dynamic> json) {
  return _Person2.fromJson(json);
}

/// @nodoc
mixin _$Person2 {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Person2CopyWith<Person2> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Person2CopyWith<$Res> {
  factory $Person2CopyWith(Person2 value, $Res Function(Person2) then) =
      _$Person2CopyWithImpl<$Res, Person2>;
  @useResult
  $Res call({int id, String name, int age});
}

/// @nodoc
class _$Person2CopyWithImpl<$Res, $Val extends Person2>
    implements $Person2CopyWith<$Res> {
  _$Person2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Person2CopyWith<$Res> implements $Person2CopyWith<$Res> {
  factory _$$_Person2CopyWith(
          _$_Person2 value, $Res Function(_$_Person2) then) =
      __$$_Person2CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int age});
}

/// @nodoc
class __$$_Person2CopyWithImpl<$Res>
    extends _$Person2CopyWithImpl<$Res, _$_Person2>
    implements _$$_Person2CopyWith<$Res> {
  __$$_Person2CopyWithImpl(_$_Person2 _value, $Res Function(_$_Person2) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_$_Person2(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Person2 implements _Person2 {
  _$_Person2({required this.id, required this.name, required this.age});

  factory _$_Person2.fromJson(Map<String, dynamic> json) =>
      _$$_Person2FromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int age;

  @override
  String toString() {
    return 'Person2(id: $id, name: $name, age: $age)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Person2 &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Person2CopyWith<_$_Person2> get copyWith =>
      __$$_Person2CopyWithImpl<_$_Person2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Person2ToJson(
      this,
    );
  }
}

abstract class _Person2 implements Person2 {
  factory _Person2(
      {required final int id,
      required final String name,
      required final int age}) = _$_Person2;

  factory _Person2.fromJson(Map<String, dynamic> json) = _$_Person2.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get age;
  @override
  @JsonKey(ignore: true)
  _$$_Person2CopyWith<_$_Person2> get copyWith =>
      throw _privateConstructorUsedError;
}
