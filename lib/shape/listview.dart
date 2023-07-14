// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_projects/provider/dataprovider.dart';
import 'package:flutter_projects/provider/providerscreen.dart';
import 'package:flutter_projects/shape/web_screen.dart';
import 'package:provider/provider.dart';
class listview extends StatefulWidget {
   const listview({Key? key,}) : super(key: key) ;

  @override
  State<listview> createState() => _listviewState();
}


class _listviewState extends State<listview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.7,
      child:Provider.of<dataprovider>(context).loading==true?
      const Center(child:CircularProgressIndicator(color: Colors.deepOrange,) ,) :
        Consumer<providerscreen>(
        builder: (context,provider,_) {
          return ListView.separated(
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    child: Row(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height*0.17,
                            width: MediaQuery.of(context).size.width*0.3,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: FadeInImage.assetNetwork(
                              placeholder:"images/placeholper_image.jpg",
                              fit: BoxFit.cover,
                              image: "${Provider.of<dataprovider>(context).datalist[index]["urlToImage"]}",
                              imageErrorBuilder: (a,b,c){
                                return Image.asset("images/placeholper_image.jpg");
                              },
                            )
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${Provider.of<dataprovider>(context).datalist[index]["title"]}",overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: provider.colortext),maxLines: 3,),
                              Text("${Provider.of<dataprovider>(context).datalist[index]["publishedAt"]}",
                                style: TextStyle(fontSize: 15,color: provider.colorDate),)
                            ],),
                        )
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>web_screen(
                          url: Provider.of<dataprovider>(context,listen: false).datalist[index]["url"],
                          title: Provider.of<dataprovider>(context,listen: false).datalist[index]["title"])));
                    },
                  ),
                );
              },
              separatorBuilder: (context, index){
                return Divider(color:provider.colortext
                );
              }, itemCount: Provider.of<dataprovider>(context).datalist.length);
        }
      ),
    );
  }
}
