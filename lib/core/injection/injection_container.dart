import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mind_buzz_refactor/features/login/domain/usecases/update_pin_code_use_cases.dart';

import '../../features/calender/data/datasources/data_source_remotely_of_calender.dart';
import '../../features/calender/data/repositories/calender_repository_impl.dart';
import '../../features/calender/domain/repositories/repositories_calender.dart';
import '../../features/calender/presentation/bloc/calender_bloc.dart';
import '../../features/chapters/data/data_sources/data_source_remotely_of_chapter.dart';
import '../../features/chapters/data/repositories/chapter_repository_impl.dart';
import '../../features/chapters/domain/repositories/repositories_chapter.dart';
import '../../features/chapters/domain/use_cases/chapter_use_cases.dart';
import '../../features/chapters/presentation/manager/chapter_bloc.dart';
import '../../features/choose_assignment_reports/presentation/manager/bloc/get_assignment_bloc.dart';
import '../../features/home/data/datasources/data_source_remotely_of_home.dart';
import '../../features/home/data/repositories/program_repository_impl.dart';
import '../../features/home/domain/repositories/repositories_user.dart';
import '../../features/home/domain/usecases/logout_use_cases.dart';
import '../../features/home/domain/usecases/program_use_cases.dart';
import '../../features/home/presentation/bloc/get_programs_home_bloc.dart';
import '../../features/login/data/datasources/data_source_remotely_of_game.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/repositories_user.dart';
import '../../features/login/domain/usecases/auto_user_use_cases.dart';
import '../../features/login/domain/usecases/update_user_data_use_case.dart';
import '../../features/login/domain/usecases/user_use_cases.dart';
import '../../features/login/presentation/bloc/login_data_bloc.dart';
import '../../features/phonetics/data/data_sources/data_source_remotely_of_contact_lesson.dart';
import '../../features/math_book1/data/data_sources/local_data_source_remotely_of_contact_lesson.dart';
import '../../features/phonetics/data/repositories/contact_lesson_repository_impl.dart';
import '../../features/phonetics/domain/repositories/repositories_contact_lesson.dart';
import '../../features/phonetics/domain/use_cases/contact_lesson_use_cases.dart';
import '../../features/phonetics/domain/use_cases/game_use_cases.dart';
import '../../features/phonetics/presentation/manager/bloc/contact_lesson_bloc.dart';
import '../../features/notification/data/datasources/data_source_remotely_of_notification.dart';
import '../../features/notification/data/repositories/notification_repository_impl.dart';
import '../../features/notification/domain/repositories/repositories_notification.dart';
import '../../features/notification/presentation/bloc/notification_bloc.dart';
import '../../features/phonetics/presentation/manager/main_cubit/current_game_phonetics_cubit.dart';
import '../../features/reports/data/data_sources/data_source_remotely_of_parent_reports.dart';
import '../../features/reports/data/repositories/parent_reports_repository_impl.dart';
import '../../features/reports/domain/repositories/repository_parent_reports.dart';
import '../../features/reports/domain/use_cases/parent_reports_use_cases.dart';
import '../../features/settings/data/datasources/data_source_remotely_of_settings.dart';
import '../../features/settings/data/repositories/settings_repository_impl.dart';
import '../../features/settings/domain/repositories/repositories_setting.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/student_assignment/data/datasources/data_source_remotely_of_parent_assignment.dart';
import '../../features/student_assignment/data/repositories/parent_assignment_repository_impl.dart';
import '../../features/student_assignment/domain/repositories/repository_student_assignment.dart';
import '../../features/student_assignment/domain/usecases/parent_assignment_use_cases.dart';
import '../../features/unit/data/data_sources/data_source_remotely_of_unit.dart';
import '../../features/unit/data/repositories/unit_repository_impl.dart';
import '../../features/unit/domain/repositories/repositories_unit.dart';
import '../../features/unit/domain/use_cases/unit_use_cases.dart';
import '../../features/unit/presentation/manager/bloc/get_unit_bloc.dart';
import '../apis_connections/api_connection.dart';
import '../network/network_info.dart';
part 'injection_import.dart';
