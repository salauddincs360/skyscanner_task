import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:skyscanner_task/controller/SearchController.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';
import 'package:skyscanner_task/res/data/search_data.dart';
import 'package:intl/intl.dart';
class CabinSelectorScreen extends StatefulWidget {
  const CabinSelectorScreen({Key? key}) : super(key: key);

  @override
  State<CabinSelectorScreen> createState() => CabinSelectorScreenState();
}

class CabinSelectorScreenState extends State<CabinSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SearchController>(
          init: SearchController(),
          builder: (controller)=>Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.close,color: Colors.black)
                      ),
                      SizedBox(height: 20,),
                      Text("Cabin class",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                      SizedBox(height: 3),
                      Text("16 - 23 Dec"),
                      SizedBox(height: 30),
                      ...Iterable.generate(SearchData().cabin_types.length).map((e) => InkWell(
                        onTap: (){
                          controller.SetCabinType(SearchData().cabin_types[e]);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black12)
                              )
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("${SearchData().cabin_types[e]}",style: TextStyle(color: SearchData().cabin_types[e].toString()==controller.cabin_type?ColorsHelper().text_selected_color:Colors.black),),
                                flex: 8,
                              ),
                              Expanded(
                                child: FaIcon(FontAwesomeIcons.check,color: SearchData().cabin_types[e].toString()==controller.cabin_type?ColorsHelper().text_selected_color:Colors.white,size: 20,),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                      ))
                      
                     
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xfff0f2f2),
                        border: Border(
                            top: BorderSide(
                                color: Colors.black12
                            )
                        )
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 7),
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(ColorsHelper().button_color)
                            ),
                            child: Text("Done"),
                          ),
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
