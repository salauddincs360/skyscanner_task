import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skyscanner_task/api/api_urls.dart';
import 'package:skyscanner_task/controller/SearchController.dart';
import 'package:skyscanner_task/network/NetworkRequestHandler.dart';

class ToAirportSelectorScreen extends StatefulWidget {
  var pos;
  ToAirportSelectorScreen({this.pos=null});

  @override
  State<ToAirportSelectorScreen> createState() => ToAirportSelectorScreenState();
}

class ToAirportSelectorScreenState extends State<ToAirportSelectorScreen> {

  SearchController _searchController=Get.put(SearchController());

  var searchField=TextEditingController();
  var is_loading=false;

  @override
  void initState() {
    GetAirportsData();
    super.initState();
  }


  GetAirportsData()async{

    if(_searchController.airports.length==0){
      try{
        setState(() {
          is_loading=true;
        });
        var request=await NetworkRequestHandler().GetRequestHandler(ApiUrls().airports);
        print("Success ${request}");
        _searchController.SetAirports(request);
        setState(() {
          is_loading=false;
        });
        print("AAAAA ${_searchController.airports.length}");

      }catch(e){
        print("Error ${e}");
      }

    }


  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller)=>Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.close,color: Colors.black54,)),
          title: Text("Where to?",style: TextStyle(color: Colors.black,fontSize: 14),),
        ),
        body: Column(
          children: [
            Container(
              height: 70,
              padding: EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.only(left:15,right: 15,bottom: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12)
                  )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchField,

                      onChanged: (value){
                        controller.AirportFilter(value.toString());
                      },
                      decoration: InputDecoration(
                          hintText: "Country,city or airport",
                          hintStyle: TextStyle(color: Colors.black38,fontSize: 14),
                          isDense: true,
                          contentPadding: EdgeInsets.only(left: 10,right: 10,top: 14,bottom: 14),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          )
                      ),
                    ),
                    flex: 5,
                  ),
                  searchField.text.length>0?Expanded(
                    child: InkWell(
                      onTap: (){
                        controller.AirportClearFilter();
                        searchField.clear();
                      },
                      child: Container(
                          height: 45,
                          padding: EdgeInsets.only(),
                          child: Center(child: Text("Cancel"))),
                    ),flex: 1,):SizedBox()
                ],
              ),
            ),
            is_loading==true?Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...Iterable.generate(10).map((pos)=>Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12)
                          )
                      ),
                      child: ListTile(
                        title: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 20,
                            margin: EdgeInsets.only(top: 5,right: Get.width/2.5),
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 20,
                            margin: EdgeInsets.only(top: 5,right: Get.width/1.6),
                            color: Colors.white,
                          ),
                        ),
                      )),
                  )
                ],
              ),
            ):
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...Iterable.generate(controller.airports.length).map((pos)=>InkWell(
                    onTap: (){
                      controller.FlyingAirportName(controller.airports[pos].airportName);
                      if(widget.pos!=null){
                        controller.SetMultiCityTo(widget.pos,controller.airports[pos].airportName);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12)
                          )
                      ),
                      child: ListTile(
                        title: Text("${controller.airports[pos].airportName}"),
                        subtitle: Text("${controller.airports[pos].countryName}"),
                      ),
                    ),
                  ))




                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

