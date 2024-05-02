import 'package:bloc/bloc.dart';


class WhoAmICubit extends Cubit<int?> {
  final int? currentIndex;
  WhoAmICubit({this.currentIndex}) : super(currentIndex);
  addToSelected({required int newIndex}){
    emit(newIndex);
  }
}
