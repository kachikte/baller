import 'package:baller/src/config/config.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionSuccessfulScreen extends ConsumerStatefulWidget {
  const TransactionSuccessfulScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionSuccessfulScreenState();
}

class _TransactionSuccessfulScreenState
    extends ConsumerState<TransactionSuccessfulScreen> {
  navigateToMatchList() {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appWhite,
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.close,
                color: AppColors.appBlack,
                size: 20,
              ),
            ),
          ],
        ),
        elevation: 1,
      ),
      backgroundColor: AppColors.appWhite,
      body: SizedBox(
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height * .72,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.transactionSuccessfulPng),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Transaction Successful',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Your transfer was successful and booking confirmed.',
                    style: TextStyle(
                      color: AppColors.appBlack.withOpacity(.5),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: width * .5,
                    child: AppButton(
                        buttonRadius: 10,
                        borderColor:
                            AppColors.primaryBackgroundColor.withOpacity(.3),
                        pressedFunction: () {},
                        buttonColor: AppColors.appWhite,
                        buttonText: 'View booking details'),
                  )
                ],
              ),
            ),
            Container(
              width: width,
              height: 70,
              padding: const EdgeInsets.all(10),
              child: AppButton(
                  buttonRadius: 10,
                  borderColor: AppColors.primaryBackgroundColor.withOpacity(.3),
                  pressedFunction: () {},
                  buttonColor: AppColors.appWhite,
                  buttonText: 'Close'),
            )
          ],
        ),
      ),
    );
  }
}
