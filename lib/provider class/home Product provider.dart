import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/Model/Home%20Product%20Model.dart';
import 'package:testing_riverpod/product%20repository.dart';
import 'package:testing_riverpod/provider%20class/home%20Product%20provider.dart';

import 'home Product provider.dart';
import 'home Product provider.dart';

class HomeProductProvider extends ChangeNotifier{
  var productList = <HomeProductModel> [];

  var isLoading = true;

  setLoading (bool loading){
    isLoading = loading;
    notifyListeners();
  }

  Future<void> getAllProduct () async {
    var product =  await ProductRepository.fetchAllProduct();
    productList = product;
    setLoading(false);
  }



}

