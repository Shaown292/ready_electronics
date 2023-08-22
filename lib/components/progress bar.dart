

import 'package:flutter/cupertino.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class ProgressBar {
  late SimpleFontelicoProgressDialog progressType;
  late BuildContext context;
  bool isShow = false;
  void showDialogue ({required BuildContext widgetContext, required String message, required SimpleFontelicoProgressDialogType type}){

    isShow = true;
    context = widgetContext;
    progressType = SimpleFontelicoProgressDialog(context: context, barrierDimisable: false);
    progressType.show(message: message, type: type);

  }

  void hideDialogue(){
    if (isShow){
      isShow = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}