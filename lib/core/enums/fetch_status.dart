import 'package:freezed_annotation/freezed_annotation.dart';

// part 'fetch_status.freezed.dart';
// @freezed
// class CallState with _$CallState {
//
//  const factory CallState({
//     @Default(CallStatus.pure) CallStatus status,
//     @Default('') String title,
//     @Default('') String message,
//
//   }) = _CallState;
// }
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

