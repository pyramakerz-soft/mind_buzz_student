import 'package:json_annotation/json_annotation.dart';

import 'notification_item_model.dart';

part 'main_of_notifications_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class MainOfNotificationsModel {
  List<NotificationItemModel>? notifications;
  num? count;

  MainOfNotificationsModel({this.notifications, this.count});
  factory MainOfNotificationsModel.fromJson(Map<String, dynamic> json) {
    return _$MainOfNotificationsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainOfNotificationsModelToJson(this);

  @override
  List<Object?> get props => [
        count,
        notifications,
      ];
}
