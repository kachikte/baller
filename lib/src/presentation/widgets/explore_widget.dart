import 'package:baller/src/config/app_images.dart';
import 'package:baller/src/presentation/widgets/widgets.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * .17,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        image: const DecorationImage(
          image: AssetImage(AppImages.exploreBackgroundPattern),
          fit: BoxFit.cover,  // You can change this to BoxFit.contain, BoxFit.fill, etc.
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: height * .02, horizontal: width * .03),
      padding: EdgeInsets.symmetric(vertical: height * .04, horizontal: width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Explore", style: TextStyle(color: AppColors.appWhite,),),
              Text("Explore and book", style: TextStyle(color: AppColors.appWhite, fontWeight: FontWeight.w700, fontSize: 20),),
              Text("your first session", style: TextStyle(color: AppColors.appWhite, fontWeight: FontWeight.w700, fontSize: 20),)
            ],
          ),
          AppButton(pressedFunction: (){}, buttonColor: AppColors.appWhite, buttonText: 'Explore', suffixButtonIcon: CircleAvatar(radius: 12, backgroundColor: AppColors.appBlack, child: Icon(Icons.arrow_forward, color: AppColors.appWhite,),),)
        ],
      ),
    );
  }
}
