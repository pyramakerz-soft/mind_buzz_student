import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../home/domain/entities/test_model.dart';
import '../../../reports/domain/entities/month_model.dart';
import 'tests_types_model.dart';
part 'main_data_test.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class MainDataTestsModel extends Equatable {
  List<TestModel>? tests;
  List<TestModel>? progress;
  List<TestsTypesModel>? testTypes;
  List<MonthModel>? tprogress;
  MainDataTestsModel({this.testTypes, this.tests, this.progress, this.tprogress});

  factory MainDataTestsModel.fromJson(Map<String, dynamic> json) {
    return _$MainDataTestsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainDataTestsModelToJson(this);

  @override
  List<Object?> get props => [tests, testTypes, progress, tprogress];
}
