import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';

class OneWayScreen extends StatefulWidget {
  const OneWayScreen({Key? key}) : super(key: key);

  @override
  State<OneWayScreen> createState() => OneWayScreenState();
}

class OneWayScreenState extends State<OneWayScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                                    Text("Departing From",style: TextStyle(),)
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
                                    Text("Flying To",style: TextStyle(),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 25,
                            top: 42,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: ColorsHelper().circular_arrow,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: FaIcon(FontAwesomeIcons.arrowRightArrowLeft,size: 12,color: Colors.white,),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    SizedBox(height: 15,),
                    Container(
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Economy",style: TextStyle(color: ColorsHelper().icon_color),),
                                Icon(Icons.arrow_drop_down_outlined,color: ColorsHelper().icon_color,)
                              ],
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
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.black45,),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
