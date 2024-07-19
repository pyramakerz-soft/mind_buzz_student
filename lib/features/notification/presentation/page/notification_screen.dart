import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/core/widgets/show_snackbar.dart';
import 'package:mind_buzz_refactor/features/calender/presentation/widgets/custom_empty_widget.dart';
import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';
import 'package:mind_buzz_refactor/features/notification/presentation/manager/cubit/notification_state.dart';
import 'package:mind_buzz_refactor/features/notification/presentation/widget/notification_item.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../home/presentation/widgets/switch_bar.dart';
import '../../../login/presentation/page/login_screen.dart';
// import '../notification_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../manager/cubit/notification_cubit.dart';
import '../widget/switch_title.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Notifications'),
      body: BlocProvider<NotificationCubit>(
        create: (_) => di.sl<NotificationCubit>(),
        child: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            if (state.isError) {
              showSnackBar(context, message: state.message);
            }
          },
          builder: (BuildContext context, NotificationState state) {
            final notificationCubit = context.read<NotificationCubit>();
            final notifications = state.notifications;
            return Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildChipItems(state, notificationCubit),
                  20.ph,
                  state.isLoading
                      ? _buildLoadingIndicator()
                      : notifications.isEmpty
                          ? _buildEmptyCase()
                          : _buildListOfNotifications(notifications)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildChipItems(
      NotificationState state, NotificationCubit notificationCubit) {
    return Row(children: [
      SwitchTitle(
        title: 'Read',
        index: 1,
        currentIndex: state.isRead,
        onTap: () => notificationCubit.getNotifications(
          isRead: true,
        ),
      ),
      10.pw,
      SwitchTitle(
        title: 'Unread',
        index: 0,
        currentIndex: state.isRead,
        onTap: () => notificationCubit.getNotifications(
          isRead: false,
        ),
      ),
    ]);
  }

  Widget _buildEmptyCase() {
    return const Expanded(
      child: Center(
        child: CustomEmptyWidget(
          title: 'No Notifications Found.',
          emptyScreenTypes: EmptyScreenTypes.emptyNotifications,
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() => const Expanded(
        child: CupertinoActivityIndicator(),
      );

  Widget _buildListOfNotifications(List<NotificationItemModel> notifications) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 50.h),
        child: ListView.separated(
          itemCount: notifications.length,
          itemBuilder: (context, index) => NotificationItem(
            notification: notifications[index],
          ),
          separatorBuilder: (context, index) => 10.ph,
        ),
      ),
    );
  }
}
