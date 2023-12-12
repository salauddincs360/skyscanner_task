import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:skyscanner_task/controller/SearchController.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';
import 'package:skyscanner_task/views/search/airport_search/from_airport_selector_screen.dart';
import 'package:skyscanner_task/views/search/airport_search/to_airport_selector_screen.dart';
import 'package:skyscanner_task/views/search/date_picker/date_picker_multi_city_screen.dart';
import 'package:skyscanner_task/views/search/date_picker/date_picker_screen.dart';
import 'package:skyscanner_task/views/search/dialog/cabin_selector_screen.dart';
import 'package:skyscanner_task/views/search/dialog/travelers_quantity_screen.dart';
import 'package:skyscanner_task/views/search/result/search_result_screen.dart';

class MulticityScreen extends StatefulWidget {
  const MulticityScreen({Key? key}) : super(key: key);

  @override
  State<MulticityScreen> createState() => MulticityScreenState();
}

class MulticityScreenState extends State<MulticityScreen> {



  ScrollController scrollController=ScrollController();
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller)=>Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: 380,
              maxHeight: controller.multi_flight_height
            ),
            // height: MediaQuery.of(context).size.height-210,
            decoration: BoxDecoration(
                color: ColorsHelper().appbar_color,
                border: Border(
                    bottom: BorderSide(color: Colors.white70)
                )
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: scrollController,
                              children: [
                                ...Iterable.generate(controller.multiple_flight.length).map((e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10,top: 5,right: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text("Flight ${e+1}",style: TextStyle(color: Colors.white,)),
                                          ),
                                          Expanded(child: controller.multiple_flight.length>2?Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                  onTap: (){
                                                    controller.RemoveFlight(e,context);
                                                  },
                                                  child: Icon(Icons.close,color: Colors.white,))):SizedBox())
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FromAirportSelectorScreen(pos: e,)));

                                            },
                                            child: Container(
                                              height: 45,
                                              padding: EdgeInsets.only(left: 15,right: 15),
                                              margin: EdgeInsets.only(left: 8,right: 2,top: 8,bottom: 1),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(8))
                                              ),
                                              child: Row(
                                                children: [
                                                  FaIcon(FontAwesomeIcons.planeDeparture,size: 18,),
                                                  SizedBox(width: 15,),
                                                  Text("${controller.multiple_flight[e]["from"]}",style: TextStyle(),)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ToAirportSelectorScreen(pos: e,)));

                                            },
                                            child: Container(
                                              height: 45,
                                              padding: EdgeInsets.only(left: 15,right: 15),
                                              margin: EdgeInsets.only(left: 2,right: 8,top: 8,bottom: 1),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(Radius.circular(8))
                                              ),
                                              child: Row(
                                                children: [
                                                  FaIcon(FontAwesomeIcons.planeArrival,size: 18,),
                                                  SizedBox(width: 15,),
                                                  Text("${controller.multiple_flight[e]["to"]}",style: TextStyle(),)
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),

                                    InkWell(
                                      onTap: (){

                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DatePickerMultiCity(e)));

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
                                            Text("${controller.multiple_flight[e]["date"]}",style: TextStyle(),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                                InkWell(
                                  onTap: (){
                                    controller.AddNewFlight(context);
                                    scrollController.animateTo(scrollController.position.maxScrollExtent+100, duration: Duration(seconds: 1), curve:Curves.easeOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    margin: EdgeInsets.all(12),
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(child: Text("ADD FLIGHT",style: TextStyle(color: Colors.white),),),
                                  ),
                                ),
                                SizedBox(height: 15,),
                              ],
                            ),
                  flex: 7,
                ),
                Expanded(
                  child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(

                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(color: Colors.black45)
                              )
                          ),
                          padding: EdgeInsets.only(left: 15,right: 8,top: 5),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TravelersQuantityScreen()));

                            },
                            child: Row(
                              children: [
                                Expanded(
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
                          ),
                        ),
                      ),
                      Positioned(
                          right: 20,
                          bottom: -20,
                          child: InkWell(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchResultScreen()));

                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: ColorsHelper().circular_arrow,
                              child: FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,),
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),

          )
        ],
      ),
    );
  }
}
