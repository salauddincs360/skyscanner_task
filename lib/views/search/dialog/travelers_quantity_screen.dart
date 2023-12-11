import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';

class TravelersQuantityScreen extends StatefulWidget {
  const TravelersQuantityScreen({Key? key}) : super(key: key);

  @override
  State<TravelersQuantityScreen> createState() => _TravelersQuantityScreenState();
}

class _TravelersQuantityScreenState extends State<TravelersQuantityScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12)
                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Adults",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text("12+ Years",style: TextStyle(fontSize: 12),),


                              ],
                            ),
                            flex: 8,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("-",style: TextStyle(fontSize: 22),)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("0",style: TextStyle(fontSize: 18),)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("+",style: TextStyle(fontSize: 22),)),
                                  ),
                                )

                              ],
                            ),

                            flex: 4,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12)
                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Children",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text("2-12 Years",style: TextStyle(fontSize: 12),),


                              ],
                            ),
                            flex: 8,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("-",style: TextStyle(fontSize: 22),)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("0",style: TextStyle(fontSize: 18),)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("+",style: TextStyle(fontSize: 22),)),
                                  ),
                                )

                              ],
                            ),

                            flex: 4,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12)
                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Infrants",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                Text("Under 2 Years",style: TextStyle(fontSize: 12),),


                              ],
                            ),
                            flex: 8,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("-",style: TextStyle(fontSize: 22),)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("0",style: TextStyle(fontSize: 18),)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(child: Text("+",style: TextStyle(fontSize: 22),)),
                                  ),
                                )

                              ],
                            ),

                            flex: 4,
                          ),
                        ],
                      ),
                    )
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
    );
  }
}
