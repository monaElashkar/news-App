// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/dataprovider.dart';
import '../../shape/listview.dart';
import '../../shape/sorce.dart';
class sciness extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final cat;
  const sciness({Key? key,required this.cat}) : super(key: key);

  @override
  State<sciness> createState() => _scinessState();
}

class _scinessState extends State<sciness> {
  void initState() {
    Future.delayed(Duration.zero,(){
      Provider.of<dataprovider>(context,listen: false).getlist(
          cat:widget.cat,
          scr:Provider.of<dataprovider>(context).dataScience[0]["Url"]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<dataprovider>(
      builder: (context,provider,_) {
        return Column(
          children:  [
            sorce(data:provider.dataScience ,cat: widget.cat,),
            listview()
          ],
        );
      }
    );
  }
}
