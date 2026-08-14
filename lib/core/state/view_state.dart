import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_flutter_template/core/models/fetch_status.dart';

part 'view_state.freezed.dart';

@freezed
sealed class ViewState<T> with _$ViewState<T> {
  const factory ViewState({
    @Default('') String message,
    @Default(BaseContentState()) BaseContentState<T> actionStatus,
  }) = _ViewState<T>;
}
