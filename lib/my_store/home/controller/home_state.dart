import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/networking/api_error_handler.dart';
import 'package:my_store/my_store/home/data/model/all_apps_model.dart';
import 'package:my_store/my_store/home/data/model/category_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;

  /// Toggles
  const factory HomeState.changed(bool isGridView) = Changed;

  /// Home
  const factory HomeState.homeLoading() = Loading;

  const factory HomeState.homeLoaded(List<AppsCategoryData> apps) = Loaded;

  const factory HomeState.homeError(ErrorHandler errorHandler) = Error;

  /// Category
  const factory HomeState.categoryLoading() = CategoryLoading;

  const factory HomeState.categoryLoaded(List<CategoryData> categories) =
      CategoryLoaded;

  const factory HomeState.categoryChanged(bool isSelected) = CategoryChanged;

  const factory HomeState.categoryError(ErrorHandler errorHandler) =
      CategoryError;
}
