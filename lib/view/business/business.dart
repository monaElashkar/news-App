// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/dataprovider.dart';
import '../../shape/listview.dart';
import '../../shape/sorce.dart';
class business extends StatefulWidget {

  final cat;
  const business({Key? key,required this.cat}) : super(key: key);

  @override
  State<business> createState() => _businessState();
}

class _businessState extends State<business> {
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      Provider.of<dataprovider>(context,listen: false).getlist(
          cat:widget.cat,
          scr:Provider.of<dataprovider>(context).dataBusiness[0]["Url"]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<dataprovider>(
        builder: (context,provider,_) {
          return Column(
            children:  [
              sorce(data:provider.dataBusiness ,cat: widget.cat,),
              listview()
            ],
          );
        }
    );
  }
}
