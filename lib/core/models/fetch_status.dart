import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_status.freezed.dart';

@freezed
abstract class BaseContentState<T> with _$BaseContentState<T> {
  const factory BaseContentState({
    @Default(CallStatus.pure) CallStatus status,
    T? data,
    @Default('') String message,
  }) = _BaseContentState;
}

enum CallStatus {
  pure,
  inProgress,
  failed,
  success;

  bool get isPure => this == CallStatus.pure;
  bool get isInProgress => this == CallStatus.inProgress;
  bool get isFailed => this == CallStatus.failed;
  bool get isSucceeded => this == CallStatus.success;
}
