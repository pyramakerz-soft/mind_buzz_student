// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_data_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainDataTestsModel _$MainDataTestsModelFromJson(Map<String, dynamic> json) =>
    MainDataTestsModel(
      testTypes: (json['test_types'] as List<dynamic>?)
          ?.map((e) => TestsTypesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tests: (json['tests'] as List<dynamic>?)
          ?.map((e) => TestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainDataTestsModelToJson(MainDataTestsModel instance) =>
    <String, dynamic>{
      'tests': instance.tests?.map((e) => e.toJson()).toList(),
      'test_types': instance.testTypes?.map((e) => e.toJson()).toList(),
    };
