import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/utils.dart';
import '../../../../core/widgets/card_of_my_info.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../widgets/card_of_program_parent.dart';
import '../widgets/switch_bar.dart';

class AllProgramsScreen extends StatefulWidget {
  const AllProgramsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AllProgramsScreen();
  }
}

class _AllProgramsScreen extends State<AllProgramsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'All Programs'),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          BlocProvider<GetProgramsHomeBloc>(
            create: (_) =>
                di.sl<GetProgramsHomeBloc>()..add(GetProgramsRequest()),
            child: BlocConsumer<GetProgramsHomeBloc, GetProgramsHomeState>(
              listener: (context, state) {
                if (state is GetProgramsErrorInitial) {
                  if (state.message == RELOGIN_FAILURE_MESSAGE) {
                    Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                  } else {
                    final snackBar = SnackBar(
                      content: Text(state.message),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else if (state is LogOutLoadingState) {
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state is GetProgramsLoadingInitial) {
                  return const Expanded(
                      child: Center(child: CupertinoActivityIndicator()));
                } else if (state is GetProgramsCompleteInitial) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height - (210),
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 20,
                            children: List.generate(
                              state.data.length,
                              (index) => CardOfProgramParent(
                                dataOfProgram: state.data[index],
                              ),
                            ),
                          ),
                        )),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
