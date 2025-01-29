import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/my_store/home/controller/home_state.dart';
import 'package:my_store/my_store/home/data/model/all_apps_model.dart';
import 'package:my_store/my_store/home/data/model/category_model.dart';
import 'package:my_store/my_store/home/data/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeState.initial());

  List<CategoryData>? categories = [];
  List<AppsCategoryData> apps = [];

  String selectedCategory = 'All';
  bool isSelected = true;
  bool isGridView = true;

  TabController? tabController;

  void setController(TabController controller) {
    tabController = controller;
  }

  void changePage(int index) {
    tabController!.animateTo(index);
    emit(HomeState.changed(isGridView));
  }

  void getCategories() async {
    emit(HomeState.categoryLoading());
    final response = await _homeRepository.getCategories();
    response.when(
      success: (categoriesList) {
        categories = categoriesList;
        emit(HomeState.categoryLoaded(categoriesList));
      },
      failure: (errorHandler) {
        emit(HomeState.categoryError(errorHandler));
      },
    );
  }

  void setSelectedCategory(String category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      emit(HomeState.categoryLoaded(categories!));
    }
  }

  void getAllApps() async {
    emit(HomeState.homeLoading());
    final result = await _homeRepository.getAllApps();
    result.when(
      success: (appsList) {
        apps = appsList;
        emit(HomeState.homeLoaded(appsList));
      },
      failure: (errorHandler) {
        print(
            'the error with get all apps in cubit is ${errorHandler.apiErrorModel.message.toString()}');
        emit(HomeState.homeError(errorHandler));
      },
    );
  }

  void toggleLayout() {
    isGridView = !isGridView;
    emit(HomeState.changed(isGridView));
    print('the value with grid view bool is $isGridView');
  }
}
