import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          // Background image with BoxFit.cover to ensure it scales well
          Image.asset(
            R.ASSETS_IMAGES_WISHLIST_PNG,
            fit: BoxFit.cover,
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(125), // Added space between image and text
            left: ScreenUtil().setWidth(30),     // Responsive left padding
            right: ScreenUtil().setWidth(30),    // Responsive right padding
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w), // Horizontal padding adjusted for scaling
              child: Text(
                AppText.kOnboardWishListMessage,
                textAlign: TextAlign.center,
                style: appStyle(11.sp, Kolors.kGray, FontWeight.normal), // Adjust font size using ScreenUtil
              ),
            ),
          ),
        ],
      ),
    );
  }
}
