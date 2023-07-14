// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/dataprovider.dart';
import '../shape/listview.dart';
import '../shape/sorce.dart';
class enterainment extends StatefulWidget {
  final cat;
  const enterainment({Key? key,required this.cat}) : super(key: key);

  @override
  State<enterainment> createState() => _enterainmentState();
}

class _enterainmentState extends State<enterainment> {
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      Provider.of<dataprovider>(context,listen: false).getlist(
          cat:widget.cat,
          scr:Provider.of<dataprovider>(context).dataentertainment[0]["Url"]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<dataprovider>(
        builder: (context,provider,_) {
          return Column(
            children:  [
              sorce(data:provider.dataentertainment ,cat: widget.cat,),
              const listview()
            ],
          );
      }
    );
  }
}