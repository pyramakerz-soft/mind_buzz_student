part of 'notification_bloc.dart';

@immutable
abstract class NotificationsEvent extends Equatable {
  @override
  List<Object> get props => [];
}



class GetNotificationsRequest extends NotificationsEvent {

  GetNotificationsRequest();

  @override
  List<Object> get props => [];
}

