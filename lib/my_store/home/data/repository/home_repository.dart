import 'package:my_store/core/networking/api_error_handler.dart';
import 'package:my_store/core/networking/api_result.dart';
import 'package:my_store/my_store/home/data/api/home_api_service.dart';
import 'package:my_store/my_store/home/data/model/all_apps_model.dart';
import 'package:my_store/my_store/home/data/model/category_model.dart';

class HomeRepository {
  final HomeApiService _homeApiService;

  HomeRepository(this._homeApiService);

  Future<ApiResult<List<CategoryData>>> getCategories() async {
    try {
      final response = await _homeApiService.getCategories();
      print(
          'the response is success in home repo ${response.categoryData!.first.title}');
      return ApiResult.success(response.categoryData!);
    } catch (error) {
      print('the error in home repo is ${error.toString()}');
      return ApiResult.failure(ErrorHandler.handle(error.toString()));
    }
  }

  Future<ApiResult<List<AppsCategoryData>>> getAllApps() async {
    try {
      final response = await _homeApiService.getAllApps();
      print('the success with get all apps is ${response.success}');
      return ApiResult.success(response.data!.data!);
    } catch (error) {
      print('the error with get all apps is ${error.toString()}');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
