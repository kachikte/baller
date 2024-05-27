import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchDetailScreen extends ConsumerWidget {

  final SingleMatchModel singleMatchModel;

  const MatchDetailScreen({required this.singleMatchModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Map<String, dynamic> matchMapped = singleMatchModel.toMap();

    List data = [];

    matchMapped.forEach((key, value) {
      var intendingData = {'name': key, 'value': value};
      data.add(intendingData);
    });

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor.withOpacity(.7),
          elevation: 0,
          title: const Text(
            'Match Details',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ),
        body: Center(
          child: SizedBox(
            height: height,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: height * .02,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: width * .4, child: Text(data[index]['name'], overflow: TextOverflow.ellipsis,)),
                        SizedBox(width: width * .4, child: Text(data[index]['value'], overflow: TextOverflow.ellipsis,))
                      ],
                  ),
                );
              },
              itemCount: data.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
            )
          ),
        ));
  }
}
