// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import '../entertainment/entertainment.dart';
import '../general/general.dart';
import '../health/health.dart';
import '../technology/technology.dart';
import '../view/business/business.dart';
import '../view/sciness/sciness.dart';
import '../view/sport/sport.dart';
class providerscreen extends ChangeNotifier{
  int index=0;
  List categories= [
    {"image":"images/general news.png","title":"general","color":Colors.purple,"screen":const general(cat:"general" ,),},
    {"image":"images/sport.png","title":"sports","color":Colors.red,"screen":const sport(cat: "sports",)},
    {"image":"images/Health.png","title":"health","color":Colors.pinkAccent,"screen":const health(cat: "health",)},
    {"image":"images/business.png","title":"business","color":Colors.brown,"screen":const business(cat: "business",)},
    {"image":"images/environment.png","title":"entertainment","color":Colors.blue,"screen":const enterainment(cat: "entertainment",)},
    {"image":"images/science.ico","title":"science","color":Colors.amber,"screen":const sciness(cat: "science",)},
    {"image":"images/My project.png","title":"technology","color":Colors.cyan,"screen":const technology(cat: "technology",)},
  ];
  bool colormode=false;
  Color colorscreen=Colors.white;
  Color colorDate=Colors.grey;
  Color colortext=Colors.black;
  Color colorappbar=Colors.deepOrange;
  changemode(){
    colorscreen=colormode==true ?Colors.white:Colors.black12;
    notifyListeners();
    colortext=colormode==true ?Colors.black:Colors.white;
    notifyListeners();
    colorDate=colormode==true ?Colors.grey:Colors.white38;
    notifyListeners();
    colormode=!colormode;
    notifyListeners();
  }
  changeindex({required newindex}){
    index=newindex;
    notifyListeners();
  }
}