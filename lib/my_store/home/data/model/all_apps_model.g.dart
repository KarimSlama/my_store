// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_apps_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAppsModel _$AllAppsModelFromJson(Map<String, dynamic> json) => AllAppsModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : AppsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllAppsModelToJson(AllAppsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

AppsData _$AppsDataFromJson(Map<String, dynamic> json) => AppsData(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppsCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppsDataToJson(AppsData instance) => <String, dynamic>{
      'data': instance.data,
    };

AppsCategoryData _$AppsCategoryDataFromJson(Map<String, dynamic> json) =>
    AppsCategoryData(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      currentVersion: json['current_version'] as String?,
      size: (json['size'] as num?)?.toInt(),
      lastUpdate: json['last_update'] as String?,
      status: json['status'] as String?,
      link: json['link'] as String?,
      logo: json['logo'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AppsCategoryDataToJson(AppsCategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'current_version': instance.currentVersion,
      'size': instance.size,
      'last_update': instance.lastUpdate,
      'status': instance.status,
      'link': instance.link,
      'logo': instance.logo,
      'description': instance.description,
    };
