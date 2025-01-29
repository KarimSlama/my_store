import 'package:dio/dio.dart';
import 'package:my_store/core/networking/api_constants.dart';
import 'package:my_store/my_store/home/data/api/home_api_constants.dart';
import 'package:my_store/my_store/home/data/model/all_apps_model.dart';
import 'package:my_store/my_store/home/data/model/category_model.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.categories)
  Future<CategoryModel> getCategories();

  @GET(HomeApiConstants.apps)
  Future<AllAppsModel> getAllApps();
}
