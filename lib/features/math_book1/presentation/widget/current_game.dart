// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../../../core/injection/injection_container.dart' as di;
// import '../../../../core/connection.dart';
// import '../../../../core/utils.dart';
// import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
// import '../../../who_am_i/presentation/pages/who_am_i_screen.dart';
// import '../beads/match/manager/beads_matching_cubit.dart';
// import '../beads/match/page/matching_screen.dart';
// import '../beads/sum/manager/beads_sum_mcq_cubit.dart';
// import '../manager/current_game_state.dart';
// import '../manager/get_contact/contact_lesson_bloc.dart';
// import '../beads/sum/pages/mathematical_transactions_screen.dart';
// import '../manager/current_game_cubit.dart';
// import '../rods/color/manager/color_rods_cubit.dart';
// import '../rods/color/page/color_rods.dart';
//
// class CurrentGame extends StatelessWidget {
//   final String lessonId;
//
//   const CurrentGame({Key? key, required this.lessonId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // final currentIndex = context.watch<CurrentGameCubit>().state.index ?? 0;
//     return BlocProvider<ContactLessonBloc>(
//         create: (_) => di.sl<ContactLessonBloc>()
//           ..add(GetContactLessonRequest(programId: int.parse(lessonId))),
//         child: BlocConsumer<ContactLessonBloc, ContactLessonState>(
//             listener: (context, state) {
//           if (state is CompleteGameState) {
//             Utils.navigateAndRemoveUntilTo(
//                  const WhoAmIScreen(),
//                 context);
//           }
//         }, builder: (context, state) {
//           if (state is GetContactInitial) {
//             return BlocBuilder<CurrentGameCubit, CurrentGameInitial>(
//                 // listener: (context, stateOfTheGeneral) {},
//                 builder: (context, stateOfTheGeneral) {
//               int index = stateOfTheGeneral.index ?? 0;
//               context.read<CurrentGameCubit>().submitMessageAndTitle(
//                   message: state.data[index].question,
//                   title: state.data[index].question);
//               if (state.data[index].secType == SecType.beads) {
//                 if (state.data[index].type == Type.mCQ) {
//                   return BlocProvider(
//                       create: (_) =>
//                           BeadsSumMcqCubit(questionData: state.data[index]),
//                       child: BlocConsumer<BeadsSumMcqCubit, BeadsSumMcqInitial>(
//                           listener: (context, state) {
//                         log('state:$state');
//                       }, builder: (context, state) {
//                         return MathematicalTransactionsScreen(
//                           defaultActionOfSuccessAnswer: () => context
//                               .read<CurrentGameCubit>()
//                               .defaultActionOfSuccessAnswer(),
//                           defaultActionOfWrongAnswer: () => context
//                               .read<CurrentGameCubit>()
//                               .defaultActionOfWrongAnswer(),
//                           // questionData: state.data[index],
//                         );
//                       }));
//                 }
//                 else if (state.data[index].type == Type.matching) {
//                   return BlocProvider(
//                       create: (_) =>
//                           BeadsMatchingCubit(questionData: state.data[index]),
//                       child: BlocConsumer<BeadsMatchingCubit,
//                           BeadsMatchingInitial>(listener: (context, state) {
//                         log('state:$state');
//                       }, builder: (context, state) {
//                         return MatchingScreen(
//                           defaultActionOfSuccessAnswer: () => context
//                               .read<CurrentGameCubit>()
//                               .defaultActionOfSuccessAnswer(),
//                           defaultActionOfWrongAnswer: () => context
//                               .read<CurrentGameCubit>()
//                               .defaultActionOfWrongAnswer(),
//                           // questionData: state.data[index],
//                         );
//                       }));
//                 }
//                 else {
//                   return const SizedBox();
//                 }
//               }
//               else if (state.data[index].secType == SecType.rods) {
//                 if (state.data[index].type == Type.mCQ) {
//                   return const SizedBox();
//                 }
//                 else if (state.data[index].type == Type.color) {
//                   return BlocProvider(
//                       create: (_) =>
//                           ColorRodsCubit(questionData: state.data[index]),
//                       child: BlocBuilder<ColorRodsCubit, ColorRodsInitial>(
//                           builder: (context, state) {
//                         return ColorRods(
//                           defaultActionOfSuccessAnswer: () => context
//                               .read<CurrentGameCubit>()
//                               .defaultActionOfSuccessAnswer(),
//                           defaultActionOfWrongAnswer: () => context
//                               .read<CurrentGameCubit>()
//                               .defaultActionOfWrongAnswer(),
//                           // questionData: state.data[index],
//                         );
//                       }));
//                 }
//                 else {
//                   return const SizedBox();
//                 }
//               }
//               else {
//                 return const SizedBox();
//               }
//             });
//           } else if (state is GetContactLoadingInitial) {
//             return const Center(child: CupertinoActivityIndicator());
//           } else {
//             return const SizedBox();
//           }
//         }));
//   }
// }
