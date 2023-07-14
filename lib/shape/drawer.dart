// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_projects/view/home/categories.dart';
import 'package:provider/provider.dart';
import '../provider/providerscreen.dart';
class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<providerscreen>(
      builder: (context,provider,_) {
        return Drawer(
          elevation: 17,
          backgroundColor: provider.colorscreen,
          child: Column(children: [
            Container(height: MediaQuery.of(context).size.height/7,
              alignment: Alignment.center,
              width: double.infinity,
              color: provider.colorappbar,
              child:  const Text("News App!",
                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height/10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.list,size: 30,color: provider.colortext,),
                      SizedBox(width:MediaQuery.of(context).size.width/40 ,),
                      Text("Categories",
                        style: TextStyle(color:provider.colortext,fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const categories()));
              },
            ),
            Divider(color: provider.colorDate,height: 2,),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height/10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings,size: 30,color: provider.colortext,),
                      SizedBox(width:MediaQuery.of(context).size.width/40 ,),
                      Text("Settings",
                        style: TextStyle(color:provider.colortext,fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: (){},
            ),
            Divider(color: provider.colorDate,),

          ],),);
      }
    );
  }
}
