import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:games_models/games_models.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../domain/entities/main_data_test.dart';
import '../../domain/entities/tests_types_model.dart';
import '../widgets/card_of_details_assignment.dart';

class GetAssignmentScreen extends StatelessWidget {
  final MainDataTestsModel data;

  const GetAssignmentScreen({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (data.tests?.isNotEmpty ?? false) {
      return Expanded(
        child: ListView.separated(
          itemCount: data.tests?.length ?? 0,
          itemBuilder: (context, index) {
            return CardOfDetailsOfAssignment(
              data: data.tests?[index] ?? TestModel(),
              dataOfTypesOfTest: (data.tests?[index].type == null)
                  ? TestsTypesModel()
                  : data.testTypes
                          ?.where((element) =>
                              element.id == (data.tests?[index].type ?? 0))
                          .first ??
                      TestsTypesModel(),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 15); // Total of 10 + 5 padding
          },
        ),
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.emptyAssignment,
              height: 150,
            ),
            Text(
              'There is no assignment',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      );
    }
  }
}
