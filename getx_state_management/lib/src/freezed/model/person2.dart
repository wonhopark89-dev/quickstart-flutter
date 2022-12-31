import 'package:freezed_annotation/freezed_annotation.dart';

part 'person2.freezed.dart';
part 'person2.g.dart';

@freezed
class Person2 with _$Person2 {
  factory Person2({
    required int id,
    required String name,
    required int age,
  }) = _Person2;

  factory Person2.fromJson(Map<String, dynamic> json) => _$Person2FromJson(json);

}
