
import 'package:fashion_app/src/addresses/models/address_model.dart';
import 'package:flutter/material.dart';

class AddressNotifier with ChangeNotifier{
  AddressModel? address;

  void setAddress(AddressModel a) {
    address = a;
    notifyListeners();
  }
}