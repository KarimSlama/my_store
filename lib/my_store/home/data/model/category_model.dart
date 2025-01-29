import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'data')
  List<CategoryData>? categoryData;

  CategoryModel({this.categoryData});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@JsonSerializable()
class CategoryData {
  int? id;
  String? title;
  String? slug;

  CategoryData({this.id, this.title, this.slug});

 factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
