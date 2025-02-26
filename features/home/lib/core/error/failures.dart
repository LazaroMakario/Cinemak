import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server([String? message]) = ServerFailure;
  const factory Failure.connection() = ConnectionFailure;
  const factory Failure.cache() = CacheFailure;
}
