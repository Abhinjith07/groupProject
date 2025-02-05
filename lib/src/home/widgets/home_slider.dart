import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/custom_button.dart';
class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height:ScreenUtil().screenHeight *0.16 ,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
              indicatorColor: Kolors.kPrimaryLight,
                onPageChanged: (p){
                print(p);
                },
              autoPlayInterval: 5000,
              isLoop: true,
                children: List.generate(images.length,(i){
                  print(images[i]);
                  return CachedNetworkImage(
                    placeholder: placeholder,
                    errorWidget: errorWidget,
                    imageUrl: images[i],
                    fit: BoxFit.cover,
                  );
                }),
          ),
          ),
          Positioned(child:
          SizedBox(
            height:ScreenUtil().screenHeight *0.16 ,
            width: ScreenUtil().screenWidth,
            child: Padding(padding:
            EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(text: AppText.kCollection, style: appStyle(16, Kolors.kDark,FontWeight.w600)),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text('Discount 50% off \n first transaction',
                  style: appStyle(14, Kolors.kDark, FontWeight.normal),),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(text: "Shop Now", btnHeight: 0,
                  btnWidth: 150.w,)
                ],
              ),
            ),
          )
          )
        ],
      ),
    );
  }
}

List<String>images = [
  "https://snaptoro.com/coupons-category/nike-coupons/1.webp",
  "https://www.flipkart.com/q/white-puma-shoes/2.webp",
  "https://snaptoro.com/coupons-category/nike-coupons/1.webp",
  "https://www.flipkart.com/q/white-puma-shoes/2.webp"

];
