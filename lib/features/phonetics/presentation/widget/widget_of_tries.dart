import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/main_cubit/current_game_phonetics_cubit.dart';

widgetOfTries({required BuildContext context}){
  return Container(
    width: MediaQuery.of(context).size.width,
    child: GestureDetector(
      onTap: (){
        final basicData = context.read<CurrentGamePhoneticsCubit>().state.basicData;
        final gameData = context.read<CurrentGamePhoneticsCubit>().state.gameData;
        context.read<CurrentGamePhoneticsCubit>().updateDataOfCurrentGame(basicData: basicData!, gameData: gameData??[]);
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle),
            Text('rePlay')
          ],
        ),
      ),
    ),
  );

}