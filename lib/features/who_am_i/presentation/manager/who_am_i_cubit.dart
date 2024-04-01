import 'package:bloc/bloc.dart';


class WhoAmICubit extends Cubit<int?> {
  WhoAmICubit() : super(null);
  addToSelected({required int newIndex}){
    emit(newIndex);
  }
}
