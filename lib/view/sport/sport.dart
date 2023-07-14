// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/dataprovider.dart';
import '../../shape/listview.dart';
import '../../shape/sorce.dart';
class sport extends StatefulWidget {
  final cat;
  const sport({Key? key,required this.cat}) : super(key: key);

  @override
  State<sport> createState() => _sportState();
}

class _sportState extends State<sport> {
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      Provider.of<dataprovider>(context,listen: false).getlist(
          cat:widget.cat,
          scr:Provider.of<dataprovider>(context).dataSports[0]["Url"]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<dataprovider>(
        builder: (context,provider,_) {
          return Column(
            children:  [
              sorce(data:provider.dataSports ,cat: widget.cat,),
              const listview()
            ],
          );
        }
    );
  }
}
