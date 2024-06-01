import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class SwitchNotificationCubit extends Cubit<int> {
  SwitchNotificationCubit() : super(0);
  updateSwitch({required int index}){
    emit(index);
  }
}
