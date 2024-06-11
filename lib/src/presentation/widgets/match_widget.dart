import 'package:baller/src/config/app_routes.dart';
import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/presentation/widgets/app_button.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MatchWidget extends StatelessWidget {

  late SingleMatchModel singleMatchModel;

  late double height;

  MatchWidget({required this.singleMatchModel, required this.height});

  @override
  Widget build(BuildContext context) {
    var dated = singleMatchModel.date!.split('T')[0];

    return Card(
      color: AppColors.primaryColor.withOpacity(.2),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: height * .14,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
            children: [
              const Text("Home", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
              Text(singleMatchModel.homeTeam ?? '', style: TextStyle(color: AppColors.appBlack.withOpacity(.4))),
              const SizedBox(height: 10,),
              const Text("Away", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              Text(singleMatchModel.awayTeam ?? '', style: TextStyle(color: AppColors.appBlack.withOpacity(.4))),
            ],
          ),
            Column(
              children: [
                const Text("Date", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                Text(singleMatchModel.date!.isNotEmpty ? dated : '', style: TextStyle(color: AppColors.appBlack.withOpacity(.4))),
                const SizedBox(height: 10,),
                const Text("Time", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                Text(singleMatchModel.time ?? '', style: TextStyle(color: AppColors.appBlack.withOpacity(.4))),
              ],
            ),
            AppButton(
              buttonText: '',
              buttonColor: AppColors.appWhite,
                pressedFunction: () =>
                    Navigator.pushNamed(
                        context, AppRoutes.matchDetailScreen, arguments: singleMatchModel),
                buttonIcon: const Icon(Icons.remove_red_eye))
          ],
        ),
      ),
    );
  }
}
