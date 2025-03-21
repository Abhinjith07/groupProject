import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/addresses/widgets/address_tile.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/kcolors.dart';
import '../models/address_model.dart';

class AddressBlock extends StatelessWidget {
  const AddressBlock({super.key,  this.address});

  final AddressModel? address;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(text: "shipping Address", style: appStyle(13, Kolors.kPrimary, FontWeight.w500)),
        
        AddressTile(address: address!, isCheckout: true,)


      ],
    );
  }
}
