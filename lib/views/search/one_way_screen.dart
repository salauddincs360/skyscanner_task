import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:skyscanner_task/controller/SearchController.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';
import 'package:skyscanner_task/views/search/airport_search/from_airport_selector_screen.dart';
import 'package:skyscanner_task/views/search/airport_search/to_airport_selector_screen.dart';
import 'package:skyscanner_task/views/search/date_picker/date_picker_screen.dart';
import 'package:skyscanner_task/views/search/result/search_result_screen.dart';

import 'dialog/cabin_selector_screen.dart';
import 'dialog/travelers_quantity_screen.dart';

class OneWayScreen extends StatefulWidget {
  const OneWayScreen({Key? key}) : super(key: key);

  @override
  State<OneWayScreen> createState() => OneWayScreenState();
}

class OneWayScreenState extends State<OneWayScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller)=>Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: ColorsHelper().appbar_color,
                border: Border(
                    bottom: BorderSide(color: Colors.white70)
                )
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FromAirportSelectorScreen()));
                                },
                                child: Container(
                                  height: 45,
                                  padding: EdgeInsets.only(left: 15,right: 15),
                                  margin: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 1),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.planeDeparture,size: 18,),
                                      SizedBox(width: 15,),
                                      Text("${controller.departing_from}",style: TextStyle(),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 53,
                              left: 0,
                              right: 0,
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ToAirportSelectorScreen()));

                                },
                                child: Container(
                                  height: 45,
                                  padding: EdgeInsets.only(left: 15,right: 15),
                                  margin: EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 1),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.planeArrival,size: 18,),
                                      SizedBox(width: 15,),
                                      Text("${controller.flying_to}",style: TextStyle(),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 25,
                              top: 42,
                              child: InkWell(
                                onTap: (){
                                  controller.ExchangeAirport();
                                },
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: ColorsHelper().circular_arrow,
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: FaIcon(FontAwesomeIcons.arrowRightArrowLeft,size: 12,color: Colors.white,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DatePickerScreen()));
                          },
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.only(left: 15,right: 15),
                            margin: EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 1),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.calendarDays,size: 18,),
                                SizedBox(width: 15,),
                                Text("${controller.travel_date}",style: TextStyle(),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        margin: EdgeInsets.only(left: 15,right: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TravelersQuantityScreen()));

                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("${controller.adult}",style: TextStyle(color: ColorsHelper().icon_color),),
                                    SizedBox(width: 6,),
                                    FaIcon(
                                      FontAwesomeIcons.person,
                                      color: ColorsHelper().icon_color,
                                      size: 24,
                                    ),
                                    SizedBox(width: 6,),
                                    Text("${controller.children}",style: TextStyle(color: ColorsHelper().icon_color),),
                                    SizedBox(width: 6,),
                                    FaIcon(
                                      FontAwesomeIcons.person,
                                      color: ColorsHelper().icon_color,
                                      size: 19,
                                    ),
                                    SizedBox(width: 6,),
                                    Text("${controller.infants}",style: TextStyle(color: ColorsHelper().icon_color),),
                                    SizedBox(width: 6,),
                                    FaIcon(
                                      FontAwesomeIcons.childReaching,
                                      color: ColorsHelper().icon_color,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                              flex: 4,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CabinSelectorScreen()));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("${controller.cabin_type}",style: TextStyle(color: ColorsHelper().icon_color),),
                                    Icon(Icons.arrow_drop_down_outlined,color: ColorsHelper().icon_color,)
                                  ],
                                ),
                              ),
                              flex: 5,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: -20,
                  child: InkWell(
                    onTap: (){

                      if(controller.departing_from!="Departing From" && controller.flying_to!="Flying To"){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchResultScreen()));
                      }


                    },
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: ColorsHelper().circular_arrow,
                      child: FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
