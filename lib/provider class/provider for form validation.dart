import 'package:flutter/cupertino.dart';

import '../data/form validation model.dart';

class FormProvider with ChangeNotifier {
   ValidationModel _email = ValidationModel(null, null);
   ValidationModel _name = ValidationModel(null, null);
  ValidationModel get email => _email;
  ValidationModel get name => _name;

  void changeName(String value){
    if (value.length >= 3){
      _name=ValidationModel(value,null);
    } else {
      _name=ValidationModel(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }


   void changeEmail(String value){
     if (RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
       _email=ValidationModel(value,null);
     } else {
       _email=ValidationModel(null, "Invalid Email address");
     }
     notifyListeners();
   }
   void submitData(){
     print("FirstName: ${name.value}, LastName: ${email.value}");
     }

   bool get isValid {
     if (_name.value != null && _email.value != null) {
       return true;
     } else {
       return false;
     }
   }

}



