import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashboardState<T> with _$DashboardState<T> {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = Loading;
  const factory DashboardState.changed(int index) = Changed;
}