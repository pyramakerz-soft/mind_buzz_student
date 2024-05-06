part of 'notification_bloc.dart';

@immutable
abstract class NotificationsState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetNotificationsInitial extends NotificationsState {}
class GetNotificationsCompleteInitial extends NotificationsState {

}
class GetNotificationsLoadingInitial extends NotificationsState {}
class GetNotificationsErrorInitial extends NotificationsState {
  final String message;

  GetNotificationsErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
