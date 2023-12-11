import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';
import 'package:skyscanner_task/views/search/airport_search/from_airport_selector_screen.dart';
import 'package:skyscanner_task/views/search/dialog/cabin_selector_screen.dart';
import 'package:skyscanner_task/views/search/dialog/travelers_quantity_screen.dart';

class MulticityScreen extends StatefulWidget {
  const MulticityScreen({Key? key}) : super(key: key);

  @override
  State<MulticityScreen> createState() => MulticityScreenState();
}

class MulticityScreenState extends State<MulticityScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints(
              minHeight: 200,
              maxHeight: MediaQuery.of(context).size.height-200
          ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Flight 1",style: TextStyle(color: Colors.white,)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){

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
                                      Text("Departing From",style: TextStyle(),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){

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
                                      Text("Flying To",style: TextStyle(),)
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        InkWell(
                          onTap: (){
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
                                Text("Sat, Dec 16",style: TextStyle(),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("ADD FLIGHT",style: TextStyle(color: Colors.white),),),
                      ),
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TravelersQuantityScreen()));

                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15,right: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("1",style: TextStyle(color: ColorsHelper().icon_color),),
                                  SizedBox(width: 6,),
                                  FaIcon(
                                    FontAwesomeIcons.person,
                                    color: ColorsHelper().icon_color,
                                    size: 24,
                                  ),
                                  SizedBox(width: 6,),
                                  Text("0",style: TextStyle(color: ColorsHelper().icon_color),),
                                  SizedBox(width: 6,),
                                  FaIcon(
                                    FontAwesomeIcons.person,
                                    color: ColorsHelper().icon_color,
                                    size: 19,
                                  ),
                                  SizedBox(width: 6,),
                                  Text("0",style: TextStyle(color: ColorsHelper().icon_color),),
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
                                    Text("Economy",style: TextStyle(color: ColorsHelper().icon_color),),
                                    Icon(Icons.arrow_drop_down_outlined,color: ColorsHelper().icon_color,)
                                  ],
                                ),
                              ),
                              flex: 5,
                            )
                          ],
                        ),
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FromAirportSelectorScreen()));

                  },
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.black45,),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
