
import 'package:fashion_app/src/addresses/models/address_model.dart';
import 'package:fashion_app/src/cart/models/cart_count_model.dart';
import 'package:fashion_app/src/cart/models/cart_model.dart';
import 'package:fashion_app/src/categories/models/categories_model.dart';
import 'package:flutter/material.dart';

class FetchDefaultAddress {
  final AddressModel? address;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  FetchDefaultAddress(
      {required this.address,
        required this.isLoading,
        required this.error,
        required this.refetch});
}
