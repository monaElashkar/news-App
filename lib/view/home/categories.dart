// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_projects/provider/dataprovider.dart';
import 'package:flutter_projects/provider/providerscreen.dart';
import 'package:flutter_projects/shape/drawer.dart';
import 'package:flutter_projects/view/home/homescreen.dart';
import 'package:provider/provider.dart';
class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,()async{
      Provider.of<dataprovider>(context,listen: false).getdata(cat: "general");
      Provider.of<dataprovider>(context,listen: false).getdata(cat: "sports");
      Provider.of<dataprovider>(context,listen: false).getdata(cat: "health");
      Provider.of<dataprovider>(context,listen: false).getdata(cat: "business");
      Provider.of<dataprovider>(context,listen: false).getdata(cat: "entertainment");
      Provider.of<dataprovider>(context,listen: false).getdata(cat: "science");
      Provider.of<dataprovider>(context,listen: false).getdata(cat: "technology");
    });
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
                    icon: const Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.menu,size: 30,),
                    ),
                    onPressed: () {Scaffold.of(context).openDrawer();},
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
              title: const Text("News App",
                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              centerTitle: true,
              actions: [Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(onPressed: (){
                  provider.changemode();
                }, icon:Icon(provider.colormode?Icons.lightbulb_outline:Icons.lightbulb,size: 30,)),
              ),],

            ),
            drawer: const drawer(),
            body: Provider.of<dataprovider>(context).load?const Center(child: CircularProgressIndicator(color: Colors.orange,))
                :Padding(padding: const EdgeInsets.all(8.0),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8
                    ),
                       itemCount: provider.categories.length,
                        itemBuilder: (context,index)=> Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: InkWell(
                             child: Container(
                               margin: const EdgeInsets.only(right: 5,bottom: 5),
                                 decoration: BoxDecoration(
                                   color: provider.categories[index]["color"],
                                   borderRadius: BorderRadius.only(
                                     topLeft: const Radius.circular(20),
                                     topRight: const Radius.circular(20),
                                     bottomRight: Radius.circular(index%2==0?0:20),
                                     bottomLeft: Radius.circular(index%2==0?20:0)

                                   )
                                 ),

                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Expanded(child: Image.asset(provider.categories[index]["image"],)),
                                     Text(provider.categories[index]["title"],style: const TextStyle(
                                       color:Colors.white,
                                       fontSize: 20,
                                       fontWeight: FontWeight.bold
                                     ),),
                                     SizedBox(height: MediaQuery.of(context).size.height*.02,)
                                   ],
                                 )),
                             onTap: (){
                               context.read<dataprovider>().changename(provider.categories[index]["title"]);
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homescreen(
                                 page: provider.categories[index]["screen"],)));
                             },
                           ),
                         )),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
