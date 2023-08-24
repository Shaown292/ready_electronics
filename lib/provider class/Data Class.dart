import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartProvider extends ChangeNotifier{
  final List<int> _selectedItems = [];
  List<int> get selectedItems => _selectedItems ;


  int _counter=0;
  int get counter => _counter;

  int _favCounter=0;
  int get favCounter => _favCounter;

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  String _productName = "";
  String get productName => _productName;

  int _oldPrice = 0;
  int get oldPrice => _oldPrice;

  String _image = "";
  String get image => _image;

  void _setPreferenceItems () async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("cartItems", _counter);
    preferences.setInt("favItems", _favCounter);
    preferences.setInt("totalPrice", _totalPrice);
    preferences.setString("productName", _productName);
    preferences.setString("image", _image);
    preferences.setInt("oldPrice", _oldPrice);
    notifyListeners();
  }
  void _getPreferenceItems () async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt("cartItems")!;
    _favCounter = preferences.getInt("favItems")!;
    _totalPrice = preferences.getInt("totalPrice")!;
    _image = preferences.getString("image")!;
    _oldPrice = preferences.getInt("oldPrice")!;
    _productName = preferences.getString("productName")!;
     notifyListeners();
  }
  void addImage (String image){
    _image = image;
    _setPreferenceItems();
    notifyListeners();
  }

  String getImage (){
    return _image;
  }
  void addName (String name){
    _productName = name;
    _setPreferenceItems();
    notifyListeners();
  }

  String getProductName (){
    return _productName;
  }

  void emptyingCart (){
    _counter =0;
    _setPreferenceItems();
    notifyListeners();
  }
  void addCounter (){
    _counter++;
    _setPreferenceItems();
    notifyListeners();
  }
  void removeCounter (){
    _counter--;
    _setPreferenceItems();
    notifyListeners();
  }

  int getCounter (){
    _getPreferenceItems();
    return _counter;
  }
  void addFavCounter (){
    _favCounter++;
    _setPreferenceItems();
    notifyListeners();
  }
  void removeFavCounter (){
    _favCounter--;
    _setPreferenceItems();
    notifyListeners();
  }

  int getFavCounter (){
    _getPreferenceItems();
    return _favCounter;
  }
  void addTotalPrice (int productPrice){
    _totalPrice = _totalPrice + productPrice ;
    _setPreferenceItems();
    notifyListeners();
  }
  void removeTotalPrice (int productPrice){
    _totalPrice = _totalPrice - productPrice;
    _setPreferenceItems();
    notifyListeners();
  }
  int getTotalPrice (){
    _getPreferenceItems();
    return _totalPrice;
  }
  void addOldPrice (int productPrice){
    _oldPrice =  productPrice ;
    _setPreferenceItems();
    notifyListeners();
  }

  int getOldPrice (){
    _getPreferenceItems();
    return _oldPrice;
  }
  static CartProvider of(
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
   addItems (int value){
    _selectedItems.add(value);
    notifyListeners();
  }
  removeItems (int value){
    _selectedItems.remove(value);
    notifyListeners();
  }
}


class AddDetailsProvider extends ChangeNotifier{

  String _name = "";
  String get name => _name;
  String _email = "";
  String get email => _email;
  String _address = "";
  String get address => _address;
  String _mobile = "";
  String get mobile => _mobile;

  void _setPreferenceItems () async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", _name);
    preferences.setString("email", _email);
    preferences.setString("address", _address);
    preferences.setString("mobile", _mobile);
    notifyListeners();
  }
  void _getPreferenceItems () async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _name = preferences.getString("name")!;
    _email =preferences.getString("email")!;
     _address = preferences.getString("address")!;
     _mobile = preferences.getString("mobile")!;
    notifyListeners();
  }
  void addName (String name){
    _name = name;
    _setPreferenceItems();
    notifyListeners();
  }

  String getName (){
    _getPreferenceItems();
    return _name;
  }
  void addEmail (String email){
    _email = email;
    _setPreferenceItems();
    notifyListeners();
  }

  String getEmail (){
    _getPreferenceItems();
    return _email;
  }

  void addAddress (String address){
    _address = address;
    _setPreferenceItems();
    notifyListeners();
  }

  String getAddress (){
    _getPreferenceItems();
    return _address;
  }

  void addMobile (String name){
    _mobile = mobile;
    _setPreferenceItems();
    notifyListeners();
  }

  String getMobile (){
    _getPreferenceItems();
    return _mobile;
  }
}

