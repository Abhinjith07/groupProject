import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/change_address_modal.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/addresses/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address, required this.isCheckout, this.setDefault, this.onDelete});

  final AddressModel address;
  final bool isCheckout;
  final void Function()? setDefault;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading:const CircleAvatar(
        radius: 28,
        backgroundColor: Kolors.kSecondaryLight,
        child: Icon(MaterialIcons.location_pin,color: Kolors.kPrimary,size: 30,),
      ),
      title: ReusableText(text: address.addressType.toUpperCase(), style: appStyle(13, Kolors.kDark, FontWeight.w400)),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(text: address.addressType, style: appStyle(11, Kolors.kGray, FontWeight.w400)),
          ReusableText(text: address.phone, style: appStyle(11, Kolors.kGray, FontWeight.w400)),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (isCheckout == true) {
                changeAddressBottomSheet(context);
              }else {

              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: kRadiusAll,
                color: isCheckout? Kolors.kPrimary : Kolors.kSecondaryLight,
              ),
              child: ReusableText(text: "change",
                  style: appStyle(12, Kolors.kWhite, FontWeight.w400)),
            ),
          )
        ],
      ),
    );
  }
}
