import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../home/domain/entities/user_courses.dart';

part 'check_assignment_state.dart';

class CheckAssignmentCubit extends Cubit<CheckAssignmentInitial> {
  final List<UserCourseModel> assignmentProgrammes;
  CheckAssignmentCubit({required this.assignmentProgrammes})
      : super(const CheckAssignmentInitial()) {
    emit(state.copyWith(assignmentProgrammes: assignmentProgrammes));
  }
}
