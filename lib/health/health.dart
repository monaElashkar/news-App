// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/dataprovider.dart';
import '../shape/listview.dart';
import '../shape/sorce.dart';
class health extends StatefulWidget {
  const health({Key? key,required this.cat}) : super(key: key);
  final cat;

  @override
  State<health> createState() => _healthState();
}

class _healthState extends State<health> {
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      Provider.of<dataprovider>(context,listen: false).getlist(
          cat:widget.cat,
          scr:Provider.of<dataprovider>(context).dataHealth[0]["Url"]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<dataprovider>(
        builder: (context,provider,_) {
          return Column(
            children:  [
              sorce(data:provider.dataHealth ,cat: widget.cat,),
              const listview()
            ],
          );
        }
    );
  }
}