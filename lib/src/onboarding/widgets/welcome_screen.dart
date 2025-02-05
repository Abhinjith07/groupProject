import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Kolors.kWhite,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = constraints.maxHeight;
            double screenWidth = constraints.maxWidth;

            return Column(
              children: [
                // Top Padding
                SizedBox(
                  height: screenHeight * 0.1, // 10% of screen height
                ),
                Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
                SizedBox(
                  height: screenHeight * 0.05, // 5% of screen height
                ),
                Text(
                  AppText.kWelcomeHeader,
                  textAlign: TextAlign.center,
                  style: appStyle(24.sp, Kolors.kPrimary, FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                SizedBox(
                  width: screenWidth - 100,
                  child: Text(
                    AppText.kWelcomeMessage,
                    textAlign: TextAlign.center,
                    style: appStyle(10.sp, Kolors.kGray, FontWeight.normal),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child:CustomButton(
                    text: AppText.kGetStarted,
                    onTap: () {
                      //TODO:uncomment the bool storage when app is ready
                      // Storage().setBool('firstOpen', true);
                      context.go('/home');
                    },
                    btnHeight: 35.h,
                    radius: 20.r,
                    btnWidth: screenWidth - 100,
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableText(text: "Already have an accout?",
                        style: appStyle(11, Kolors.kDark, FontWeight.normal)),
                    TextButton(onPressed: (){

                      context.go('/login');
                    }, child: const Text("Sign in",
                      style: TextStyle(
                        fontSize: 11,color: Colors.blue
                      ),))
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
