import 'package:baller/src/config/config.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FieldsWidget extends StatelessWidget {
  const FieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * .03),
          padding:
          EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .03),
          height: height * .35,
          width: width,
          decoration: BoxDecoration(
              border:
              Border.all(color: AppColors.appBlack.withOpacity(.2), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                child: Image.asset(
                  AppImages.footballField,
                  width: width,
                  height: height * .2,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Arena name',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: AppColors.appGreen, width: 1),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: AppColors.appGreen,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Available',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.appGreen,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.sports_baseball,
                        size: 12,
                        color: AppColors.appBlack.withOpacity(.5),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Football',
                        style: TextStyle(fontSize: 12, color: AppColors.appBlack.withOpacity(.5)),
                      ),
                    ],
                  ),
                  SizedBox(width: width * .01,),
                  SizedBox(width: 10, height: height * .015, child: VerticalDivider(width: 10, color: AppColors.appBlack,)),
                  SizedBox(width: width * .01,),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 12,
                        color: AppColors.appBlack.withOpacity(.5),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Gwarinpa',
                        style: TextStyle(fontSize: 12, color: AppColors.appBlack.withOpacity(.5)),
                      ),
                    ],
                  ),
                ],
              ),
              RichText(
                  text: TextSpan(
                      text: "From ",
                      style: TextStyle(color: AppColors.appBlack, fontSize: 12),
                      children: [
                        TextSpan(
                            text: "₦1,000.00",
                            style: TextStyle(
                                color: AppColors.appBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ]))
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 40,
          child: SizedBox(
            width: width * .8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * .04,
                  width: width * .17,
                  decoration: BoxDecoration(
                    color: AppColors.appWhite,
                    borderRadius: const BorderRadius.all(Radius.circular(5))
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Row(
                      children: [
                        Icon(Icons.star, color: AppColors.appYellow, size: 12,),
                        const SizedBox(width: 5,),
                        const Text('3.5', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),),
                        const SizedBox(width: 5,),
                        Text('(4)', style: TextStyle(color: AppColors.appBlack.withOpacity(.5), fontSize: 12),),
                      ]
                  ),
                ),
                Container(
                  height: height * .04,
                  width: width * .08,
                  decoration: BoxDecoration(
                      color: AppColors.appWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(5))
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Center(
                    child: Icon(Icons.bookmark, color: AppColors.appOrange, size: 25,),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
    ;
  }
}
