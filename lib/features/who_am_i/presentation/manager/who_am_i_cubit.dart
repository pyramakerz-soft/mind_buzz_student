import 'package:bloc/bloc.dart';
import 'package:mind_buzz_refactor/features/who_am_i/presentation/manager/who_am_i_state.dart';

class WhoAmICubit extends Cubit<WhoAmIState> {
  final int? currentIndex;
  WhoAmICubit({this.currentIndex}) : super(WhoAmIState());
  addToSelected({required int newIndex}) {
    emit(state.copyWith(index: newIndex));
  }

  clearIndex() {
    emit(state.copyWith(index: null, isFirst: true));
  }

  void openFirstTime() {
    emit(state.copyWith(index: null, isFirst: false));
  }
}
