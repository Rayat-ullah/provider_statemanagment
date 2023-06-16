import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier{
  //all fav list will be store in favlist[];
  //and also remove from favlist[];
List favlist=[];
addtofavlist(index) {
  favlist.add(index);
  notifyListeners();
}
removefromfavlist(index){
  favlist.remove(index);
  notifyListeners();
}
}