// ignore_for_file: camel_case_types, depend_on_referenced_packages, non_constant_identifier_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class dataprovider extends ChangeNotifier {
  List dataGeneral = [];
  List dataSports = [];
  List dataHealth = [];
  List dataBusiness = [];
  List dataentertainment = [];
  List dataScience = [];
  List datatechnology = [];
  List datalist = [];
  List keep = [];
  bool loading = true;
  int index = 0;
  changeIndex(index) {
    this.index = index;
    notifyListeners();
  }
  String AppBarName = "News App";
  changename(name) {
    AppBarName = name;
    notifyListeners();
  }
  bool load = true;
  getdata({required String cat}) async {
    load = true;
    notifyListeners();
    print('start');
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines/sources?category=$cat&apiKey=a0f9850820d142a8a9fdc1afbb7844e1"));
    if (res.statusCode == 200) {
      if (cat == "general") {
        print(json.decode(res.body));
        dataGeneral = json.decode(res.body)["sources"];

        notifyListeners();
      } else
        if (cat == "sports") {
        dataSports = json.decode(res.body)["sources"];
        notifyListeners();
      } else
        if (cat == "health") {
        dataHealth = json.decode(res.body)["sources"];
        notifyListeners();
      } else
        if (cat == "business") {
        dataBusiness = json.decode(res.body)["sources"];
        notifyListeners();
      } else
        if (cat == "entertainment") {
        dataentertainment = json.decode(res.body)["sources"];
        notifyListeners();
      } else
        if (cat == "science") {
        dataScience = json.decode(res.body)["sources"];
        notifyListeners();
      } else
        if (cat == "technology") {
        datatechnology = json.decode(res.body)["sources"];
        notifyListeners();
      }
    }
    else{
      print(json.decode(res.body));
      print('jfhdjfhjdhf');
    }
    load = false;
    notifyListeners();
  }
  getlist({required String cat, required scr}) async {
    loading = true;
    datalist = [];
    notifyListeners();
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?category=$cat&apiKey=a0f9850820d142a8a9fdc1afbb7844e1&source=$scr"));
    if (res.statusCode == 200) {
      datalist = jsonDecode(res.body)["articles"];
    }
    print(datalist);
    loading = false;
    notifyListeners();
  }
  searchdata({required String q}) async {
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?q=$q&apiKey=a0f9850820d142a8a9fdc1afbb7844e1"));
    if (res.statusCode == 200) {
      datalist = jsonDecode(res.body)["articles"];
      notifyListeners();
    }
    notifyListeners();
  }
  emptydatalist() {
    keep = datalist;
    datalist = [];
    loading != null;
    notifyListeners();
  }
  keepdata() {
    datalist = keep;
    notifyListeners();
  }
}
