// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_projects/provider/dataprovider.dart';
import 'package:flutter_projects/provider/providerscreen.dart';
import 'package:provider/provider.dart';
class sorce extends StatefulWidget {
  final List data;
  final cat;
  const sorce({Key? key,required this.data,required this.cat}) : super(key: key);

  @override
  State<sorce> createState() => _sorceState();
}

class _sorceState extends State<sorce> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero,(){
      Provider.of<dataprovider>(context,listen: false).changeIndex(0);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height*0.13,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
            BuildContext context, int index) {
          return InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width*0.6 ,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:  Provider.of<dataprovider>(context,listen: false).index==index? Colors.deepOrange:
                Provider.of<providerscreen>(context,listen: false).colorscreen,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.deepOrange,width: 2)

              ),

              child: Text("${widget.data[index]["name"]}",
                style: TextStyle(color:Provider.of<providerscreen>(context).colortext,fontWeight: FontWeight.w900,fontSize: 20),
                maxLines: 1,textAlign:TextAlign.center ,),
            ),
            onTap: (){
              Provider.of<dataprovider>(context,listen: false).getlist(cat: widget.cat, scr: widget.data[index]["Url"]);
              Provider.of<dataprovider>(context,listen: false).changeIndex(index);
            },
          ) ;  },
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(width: MediaQuery.of(context).size.width*0.02,); }, ),
    );
  }
}
