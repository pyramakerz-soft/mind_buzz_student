import 'package:json_annotation/json_annotation.dart';

part 'notification_item_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class NotificationItemModel {
  int? id;
  String? assignmentName;
  String? courseName;
  int? isRead;
  String? startDate;
  String? dueDate;

  NotificationItemModel({
    this.id,
    this.assignmentName,
    this.courseName,
    this.isRead,
    this.startDate,
    this.dueDate,
  });
  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return _$NotificationItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationItemModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        assignmentName,
        courseName,
        isRead,
        startDate,
        dueDate,
      ];
}
