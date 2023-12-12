import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_vertical_calendar/simple_vertical_calendar.dart';
import 'package:skyscanner_task/controller/SearchController.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';
import 'package:intl/intl.dart';
class DatePickerMultiCity extends StatefulWidget {

  var pos;
  DatePickerMultiCity(this.pos);

  @override
  State<DatePickerMultiCity> createState() => DatePickerMultiCityState();
}

class DatePickerMultiCityState extends State<DatePickerMultiCity> {

  ScrollController _scrollController=ScrollController();

  SearchController _searchController=Get.put(SearchController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close,color: Colors.black54,)),
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: (){

                  _searchController.SetMultiCityDate(widget.pos,"Anytime");

                  Navigator.of(context).pop();

                },

                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Search anytime",style: TextStyle(color: ColorsHelper().text_selected_color),)),
              ))
        ],
      ),
      body: GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller)=>Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black12)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Dates",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text(
                          "Estimated Prices",
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                        SizedBox(width:5,),
                        Icon(Icons.info,size: 13,color: Colors.black45,)
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: "${controller.multiple_flight[widget.pos]["date"]}",
                                hintStyle: TextStyle(color: Colors.black54),
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 10,right: 10,top: 14,bottom: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(color: Colors.black12)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(color: Colors.black12)
                                )
                            ),
                          ),

                        ),

                        SizedBox(width: 10,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Expanded(child: Text("S",style: TextStyle(fontWeight: FontWeight.bold),)),
                        Expanded(child: Text("M",style: TextStyle(fontWeight: FontWeight.bold),)),
                        Expanded(child: Text("T",style: TextStyle(fontWeight: FontWeight.bold),)),
                        Expanded(child: Text("W",style: TextStyle(fontWeight: FontWeight.bold),)),
                        Expanded(child: Text("T",style: TextStyle(fontWeight: FontWeight.bold),)),
                        Expanded(child: Text("F",style: TextStyle(fontWeight: FontWeight.bold),)),
                        Expanded(child: Text("S",style: TextStyle(fontWeight: FontWeight.bold),)),

                      ],
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
              flex: 4,),
            SizedBox(height: 20,),
            Expanded(
              child: SimpleVerticalCalendar(
                numOfMonth: 12,
                dayOfWeek: ["S","M","T","W","T","F","S"],
                dayOfWeekHeaderStyle:DayOfWeekHeaderStyle(
                  textStyle: TextStyle(color: Colors.white),
                ),
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlgin: TextAlign.left,
                  monthFormat: MonthFormats.MONTH_ONLY,
                ),
                calendarOption:CalendarOptions.SINGLE, // [RANGE_SELECTION, SINGLE]
                dayStyle: DayHeaderStyle(
                  textColor: Colors.black,
                  unavailableTextColor: Colors.black12,
                  selectedBackgroundColor: Colors.blue,
                  dateInRangeBackgroundColor:Color(0xffbbd4fa),
                  selectedTextColor:Colors.black,
                ),

                onDateTap: (start, end) {

                  var start_date=DateFormat("EE, MMM d").format(start);

                  _searchController.SetMultiCityDate(widget.pos,start_date);


                },
              ),
              flex: 10,
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.black12)
                  )
              ),
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Expanded(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("One-Way"),
                      ],
                    ),
                    flex: 4,
                  ),
                  Expanded(child:InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(left: 15,right: 15,top: 7,bottom: 7),
                      decoration: BoxDecoration(
                          color: ColorsHelper().appbar_color,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(child: Text("Confirm",style: TextStyle(color: Colors.white),),),
                    ),
                  ),
                    flex: 2,
                  )
                ],
              ),

            ),flex:2,),
          ],
        ),
      ),
    );
  }
}
