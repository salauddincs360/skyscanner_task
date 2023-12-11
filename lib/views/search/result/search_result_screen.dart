import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';
import 'package:skyscanner_task/res/data/search_data.dart';
import 'package:skyscanner_task/views/search/multicity_screen.dart';
import 'package:skyscanner_task/views/search/one_way_screen.dart';
import 'package:skyscanner_task/views/search/roundtrip_screen.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             height: 74,
             color: ColorsHelper().appbar_color,
             child: Container(
               padding: EdgeInsets.all(10),
               margin: EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: Colors.white,
               ),
               child: Row(
                 children: [
                   InkWell(
                       onTap: (){
                         Navigator.of(context).pop();
                       },
                       child: Icon(Icons.arrow_back)),
                   SizedBox(width: 20,),
                   Expanded(
                     child: InkWell(
                       onTap: (){

                       },
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Horzat Sahajalal International Airport",maxLines: 1,overflow: TextOverflow.clip,),
                           Text("Dec 16 - Dec 23",style: TextStyle(fontSize: 12),),
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
           Expanded(
             child: Container(
               margin: EdgeInsets.only(left: 10,right: 10),
               child: ListView(
                 shrinkWrap: true,
                 physics: ScrollPhysics(),
                 children: [
                   SizedBox(height: 20,),
                   Text("Flights to Kuala Lampur",style: TextStyle(
                       fontSize: 18
                   ),),
                   SizedBox(height: 10,),
                   SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                       children: [
                         ...Iterable.generate(SearchData().filters.length).map((e) => Container(
                           margin: EdgeInsets.only(left: 3,right: 3),
                           constraints: BoxConstraints(
                               minHeight: 26,
                               minWidth:75
                           ),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(7)),
                               border: Border.all(color: Colors.black12,width: 1),
                               color: e==0?ColorsHelper().appbar_color:Colors.white
                           ),
                           child: Center(
                             child: Text("${SearchData().filters[e]}",style: TextStyle(color: e==0?Colors.white:Colors.black),),
                           ),
                         ))
                       ],
                     ),
                   ),
                   SizedBox(height: 15,),
                   SingleChildScrollView(
                     child: Column(
                       children: [
                         ...Iterable.generate(10).map((e) => Container(
                           height: 140,
                           child: Card(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(8))
                             ),
                             child: Column(
                               children: [
                                 Container(
                                   child: ListTile(
                                     visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                     leading: Container(
                                       child: CachedNetworkImage(
                                         imageUrl: "https://tbbd-flight.s3.ap-southeast-1.amazonaws.com/airlines-logo/BG.png",
                                         height: 30,
                                         width: 30,
                                       ),
                                     ),
                                     title: Text("6:40 PM - 2:35 PM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                     subtitle: Text("KUL-DAC, Emirates",style: TextStyle(fontSize: 12),),
                                     trailing: Column(
                                       children: [
                                         Text("1 stop",style: TextStyle(fontSize: 12),),
                                         SizedBox(height: 5,),
                                         Text("17h 55m",style: TextStyle(fontSize: 12),)
                                       ],
                                     ),
                                   ),
                                 ),
                                 Container(
                                   child: ListTile(
                                     visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                     leading: Container(
                                       child: CachedNetworkImage(
                                         imageUrl: "https://tbbd-flight.s3.ap-southeast-1.amazonaws.com/airlines-logo/BG.png",
                                         height: 30,
                                         width: 30,
                                       ),
                                     ),
                                     title: Text("6:40 PM - 2:35 PM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                     subtitle: Text("KUL-DAC, Emirates",style: TextStyle(fontSize: 12),),
                                     trailing: Column(
                                       children: [
                                         Text("1 stop",style: TextStyle(fontSize: 12),),
                                         SizedBox(height: 5,),
                                         Text("17h 55m",style: TextStyle(fontSize: 12),)
                                       ],
                                     ),
                                   ),
                                 ),
                                 Align(
                                   alignment: Alignment.centerRight,
                                   child: Text(
                                     "BDT 128,294  ",
                                     style: TextStyle(fontWeight: FontWeight.bold),

                                   ),
                                 )
                               ],
                             ),

                           ),
                         ))
                       ],
                     ),
                   )

                 ],
               ),
             ),
           )
         ],
       ),
      ),
    );
  }
}
