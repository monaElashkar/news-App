// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/dataprovider.dart';
import '../../provider/providerscreen.dart';
import '../../shape/drawer.dart';
import '../../shape/search.dart';
class homescreen extends StatefulWidget {
  final  page;
   const homescreen({Key? key, required this.page}) : super(key: key) ;

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<providerscreen>(
      builder: (context,provider,_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: provider.colorscreen,
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.menu,size: 30,),
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              toolbarHeight:MediaQuery.of(context).size.height/8,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)
                  )
              ),
              backgroundColor:provider.colorappbar,
              title:  Text(Provider.of<dataprovider>(context).AppBarName,
                style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              centerTitle: true,
              actions: [
                IconButton(onPressed: (){
                  provider.changemode();
                }, icon:Icon(provider.colormode?Icons.lightbulb_outline:Icons.lightbulb,size: 30,)),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: (){
                        Provider.of<dataprovider>(context,listen: false).emptydatalist();
                        Navigator.push(context, MaterialPageRoute(builder: (context){return const search();}));
                      },
                      icon: const Icon(Icons.search,size: 30,color: Colors.white,)),
                ),
              ],

            ),
            drawer: const drawer(),
            body: widget.page

          ),
        );
      }
    );
  }
}
