import 'package:baller/src/config/config.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FeaturedFieldsWidget extends StatelessWidget {
  const FeaturedFieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * .03),
      padding: EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .03),
      height: height *.17,
      width: width * .84,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColorDark,
            width: 1
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(child: Image.asset(AppImages.footballField, width: width * .2,)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: AppColors.appGreen,
                      width: 1
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(radius: 5, backgroundColor: AppColors.appGreen,),
                    const SizedBox(width: 3,),
                    Text('Available', style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.appGreen, fontSize: 12),)
                  ],
                ),
              ),
              const Text('Arena name', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),),
              const Row(
                children: [
                  Icon(Icons.location_on_rounded, size: 12,),
                  SizedBox(width: 5,),
                  Text('Gwarinpa', style: TextStyle(fontSize: 12),),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.sports_baseball, size: 12,),
                  SizedBox(width: 5,),
                  Text('⚽', style: TextStyle(fontSize: 12),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, color: AppColors.appYellow, size: 12,),
                  const SizedBox(width: 5,),
                  const Text('3.5', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),),
                  const SizedBox(width: 5,),
                  Text('(4 Reviews)', style: TextStyle(color: AppColors.appBlack.withOpacity(.5), fontSize: 12),),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.bookmark_outline, size: 25,),
              RichText(text: TextSpan(
                  text: "From ",
                  style: TextStyle(color: AppColors.appBlack, fontSize: 12),
                  children: [
                    TextSpan(
                        text: "₦1,000.00",
                        style: TextStyle(
                            color: AppColors.appBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w700
                        )
                    ),
                  ]
              )),
            ],
          )
        ],
      ),
    );
    ;
  }
}
