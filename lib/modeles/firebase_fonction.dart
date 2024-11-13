import 'package:flutter/cupertino.dart';

class AllFonction {
    void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
 
}