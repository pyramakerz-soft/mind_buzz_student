
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexOfSwitchCubit extends Cubit<int?> {
  IndexOfSwitchCubit() : super(0);

  updateIndexOfSwitch({int? newIndex}) {
    emit( newIndex);
  }
}
