import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/src/cart/models/cart_model.dart';
import 'package:fashion_app/src/entrypoint/controllers/bottom_tab_notifier.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../products/controllers/colors_sizes_notifier.dart';

class CartNotifier with ChangeNotifier {
  Function? refetchCount;

  void setRefetchCount(Function r){
    refetchCount = r;
  }
  int _qty = 0;


  int get qty => _qty;

  void increment() {
    _qty++;
    notifyListeners();
  }

  void decrement() {
    if (_qty > 1) {
      _qty--;
      notifyListeners();
    }
  }

  int? _selectCart;

  int? get selectedCart => _selectCart;

  void setSelectedCounter(int id, int q) {
    _selectCart = id;
    _qty = q;

    notifyListeners();
  }

  void clearSelected() {
    _selectCart = null;
    _selectedCartItems.clear();
    _selectedCartItemsId.clear();
    _qty = 0;
    notifyListeners();
  }

  Future<void> deleteCart(int id, void Function() refetch) async {
    String? accessToken = Storage().getString('accessToken');

    try {
      Uri url = Uri.parse(
          '${Environment.appBaseUrl}/api/cart/delete/?id=$id');


      final response = await http.delete(
        url, headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
      );
      if (response.statusCode == 204) {
        refetch();
        refetchCount!();
        clearSelected();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  Future<void> updateCart(int id, void Function() refetch) async {
    String? accessToken = Storage().getString('accessToken');

    try {
      Uri url = Uri.parse(
          '${Environment.appBaseUrl}/api/cart/update/?id=$id&count=$qty');


      final response = await http.patch(
        url, headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
      );
      if (response.statusCode == 200) {
        refetch();
        clearSelected();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  Future<void> addToCart(String data,BuildContext ctx) async {
    String? accessToken = Storage().getString('accessToken');

    try {
      Uri url = Uri.parse(
          '${Environment.appBaseUrl}/api/cart/add/');


      final response = await http.post(
        url,
        body: data,
        headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
      );
      if (response.statusCode == 201) {
        //refetchCount
        refetchCount!();

        //navigate to  the cart
        ctx.read<ColorsSizesNotifier>().setSizes('');
        ctx.read<ColorsSizesNotifier>().setColor('');
        ctx.read<TabIndexNotifier>().setIndex(3);
        ctx.go('/home');

      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  List<int> _selectedCartItemsId =[];
  List<int> get selectedCartItemsId => _selectedCartItemsId;
  List<CartModel> _selectedCartItems = [];
  List<CartModel> get selectedCartItems => _selectedCartItems;

  double totalPrice = 0.0;

  void selectOrDeselect(int id,CartModel cartItem){
    if (_selectedCartItemsId.contains(id)){
      _selectedCartItemsId.remove(id);
      _selectedCartItems.removeWhere((i) => i.id == id);
      totalPrice = calculateTotalPrice(_selectedCartItems);
    }else{
      _selectedCartItemsId.add(id);
      _selectedCartItems.add(cartItem);
      totalPrice = calculateTotalPrice(_selectedCartItems);
    }
    notifyListeners();
  }
  double calculateTotalPrice(List<CartModel>items){
    double tp =0.0;
    for(var item in items) {
      tp += item.product.price * item.quantity;
    }
    return tp;
  }
}



