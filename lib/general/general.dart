// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/dataprovider.dart';
import '../shape/listview.dart';
import '../shape/sorce.dart';

class general extends StatefulWidget {
  const general({Key? key, required this.cat}) : super(key: key);
  final cat;

  @override
  State<general> createState() => _generalState();
}

class _generalState extends State<general> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      Provider.of<dataprovider>(context, listen: false).getlist(
          cat: widget.cat,
          scr: Provider.of<dataprovider>(context, listen: false).dataGeneral[0]["Url"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<dataprovider>(builder: (context, provider, _) {
      return Column(
        children: [
          sorce(
            data: provider.dataGeneral,
            cat: widget.cat,
          ),
          const listview()
        ],
      );
    });
  }
}
