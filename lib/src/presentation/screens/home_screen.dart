import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/presentation/providers/match_provider.dart';
import 'package:baller/src/presentation/widgets/app_banner.dart';
import 'package:baller/src/presentation/widgets/match_widget.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _refreshMatches(BuildContext context, WidgetRef ref) async {
    await ref.refresh(matchProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchData = ref.watch(matchProvider);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    navigateBack() {
      Navigator.of(context).pop();
    }
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: height,
          width: width,
          child: Center(
            child: SizedBox(
              height: height * 0.8,
              width: width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(onTap: navigateBack, child: Icon(Icons.arrow_back_ios_rounded, color: AppColors.appBlack,)),
                      AppBanner(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'List of Matches',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * .65,
                    child: matchData.when(
                      data: (matches) {
                        if (matches.data is String) {
                          return const Center(
                              child: Text(
                            'Error: Could not connect',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ));
                        } else {
                          List<SingleMatchModel> matchesData =
                              matches.data as List<SingleMatchModel>;
                          return RefreshIndicator(
                            onRefresh: () => _refreshMatches(context, ref),
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Center(
                                  child: MatchWidget(
                                      singleMatchModel: matchesData[index],
                                      height: height),
                                );
                              },
                              itemCount: matchesData.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 5,
                                );
                              },
                            ),
                          );
                        }
                      },
                      loading: () => Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )),
                      error: (error, stack) =>
                          Center(child: Text('Error: $error')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
