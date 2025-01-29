import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_apps_model.g.dart';

@JsonSerializable()
class AllAppsModel {
  final bool? success;
  @JsonKey(name: 'data')
  final AppsData? data;

  AllAppsModel({this.success, this.data});

  factory AllAppsModel.fromJson(Map<String, dynamic> json) =>
      _$AllAppsModelFromJson(json);
}

@JsonSerializable()
class AppsData {
  final List<AppsCategoryData>? data;

  AppsData({this.data});

  factory AppsData.fromJson(Map<String, dynamic> json) =>
      _$AppsDataFromJson(json);
}

@JsonSerializable()
class AppsCategoryData {
  final int? id;
  final String? title;
  final String? slug;
  @JsonKey(name: 'current_version')
  final String? currentVersion;
  final int? size;
  @JsonKey(name: 'last_update')
  final String? lastUpdate;
  final String? status;
  final String? link;
  final String? logo;
  final String? description;
  AppsCategoryData({
    this.id,
    this.title,
    this.slug,
    this.currentVersion,
    this.size,
    this.lastUpdate,
    this.status,
    this.link,
    this.logo,
    this.description,
  });

  factory AppsCategoryData.fromJson(Map<String, dynamic> json) =>
      _$AppsCategoryDataFromJson(json);
}
