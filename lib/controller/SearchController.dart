import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyscanner_task/model/AirporModel.dart';
import 'package:intl/intl.dart';
class SearchController extends GetxController{

  List<AirportsModel> airports=[];
  List<AirportsModel> airports_backup=[];

  var tab_index=0;

  bool is_loading=false;

  var departing_from="Departing From";
  var flying_to="Flying To";



  var travel_date=DateFormat("EE, MMM d").format(DateTime.now());
  var return_date=DateFormat("EE, MMM d").format(DateTime.now());


  int adult=1;
  int children=0;
  int infants=0;


  var cabin_type="Economy";


  var date_range_start_date="Anytime";
  var date_range_end_date="Add return";


  var selected_filter="Best";
  var total_result=Random().nextInt(10);


  List multiple_flight=[
    {
      "from":"Departing From",
      "to":"Flying To",
      "date":DateFormat("EE, MMM d").format(DateTime.now())
    },
    {
      "from":"Departing From",
      "to":"Flying To",
      "date":DateFormat("EE, MMM d").format(DateTime.now())
    }
  ];

  var multi_flight_height=380.00;

  var date_range_multi_city_start_date="Anytime";


  SetTabIndex(pos){
    tab_index=pos;
    update();
  }

  SetAirports(data){
    airports.clear();
    airports_backup.clear();
    for(var a=0;a<data.length; a++){
      airports.add(AirportsModel.fromJson(data[a]));
      airports_backup.add(AirportsModel.fromJson(data[a]));
    }
    update();
  }

  AirportFilter(value){
    airports.clear();
    is_loading=true;
    for(var a=0; a<airports_backup.length; a++){
      if(airports_backup[a].countryName.toString().toLowerCase().contains(value.toString().toLowerCase()) || airports_backup[a].cityName.toString().toLowerCase().contains(value.toString().toLowerCase()) || airports_backup[a].airportName.toString().toLowerCase().contains(value.toString().toLowerCase())){
        airports.add(airports_backup[a]);
      }
    }
    is_loading=false;
    update();
  }

  AirportClearFilter(){
    is_loading=true;
    airports.clear();
    for(var a=0;a<airports_backup.length; a++){
      airports.add(airports_backup[a]);
    }
    is_loading=false;
    update();
  }

  DepartingAirportName(value){
    departing_from=value;
    update();
  }

  FlyingAirportName(value){
    flying_to=value;
    update();
  }

  ExchangeAirport(){
    var from=departing_from;
    var to=flying_to;

    departing_from=to;
    flying_to=from;

    update();
  }

  SetAdult(value){
    adult=value;
    update();
  }
  SetChildren(value){
    children=value;
    update();
  }
  SetInfants(value){
    infants=value;
    update();
  }
  SetCabinType(value){
    cabin_type=value;
    update();
  }

  SetDateRangeStartDate(value){
    date_range_start_date=value;
    update();
  }
  SetDateRangeEndDate(value){
    date_range_end_date=value;
    update();
  }

  SetTravelDate(value){
    travel_date=value;
    update();
  }
  SetReturnDate(value){
    return_date=value;
    update();
  }
  CleanDateRange(){
    date_range_start_date="Anytime";
    date_range_end_date="Add return";
    update();
  }

  ChangeResultFilter(value){
    selected_filter=value;
    total_result=Random().nextInt(10);
    update();
  }

  AddNewFlight(context){
    if(multiple_flight.length>=1){
      multi_flight_height=MediaQuery.of(context).size.height-210;
    }else{
      multi_flight_height=380.00;
    }
    multiple_flight.add({
      "from":"Departing From",
      "to":"Flying To",
      "date":DateFormat("EE, MMM d").format(DateTime.now())
    });

    update();
  }
  RemoveFlight(pos,context){
    multiple_flight.removeAt(pos);
    print(multiple_flight.length);
    if(multiple_flight.length==2){
      multi_flight_height=380.00;
    }
    update();
  }

  SetMultiCityDate(pos,date){
    multiple_flight[pos]["date"]=date;
    update();
  }
  SetMultiCityFrom(pos,value){
    multiple_flight[pos]["from"]=value;
    update();
  }
  SetMultiCityTo(pos,value){
    multiple_flight[pos]["to"]=value;
    update();
  }
  ChangeLoadingStatus(status){
    is_loading=status;
    update();
  }


}