import 'package:flutter/material.dart';

class FromAirportSelectorScreen extends StatefulWidget {
  const FromAirportSelectorScreen({Key? key}) : super(key: key);

  @override
  State<FromAirportSelectorScreen> createState() => _FromAirportSelectorScreenState();
}

class _FromAirportSelectorScreenState extends State<FromAirportSelectorScreen> {

  var is_focus=false;

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
        title: Text("Where from?",style: TextStyle(color: Colors.black,fontSize: 14),),
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.only(left: 8,right: 8,bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black12)
                )
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTap: (){
                      setState(() {
                        is_focus=true;
                      });
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
                is_focus==true?Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        is_focus=false;
                      });
                    },
                    child: Container(
                        height: 45,
                        padding: EdgeInsets.only(),
                        child: Center(child: Text("Cancel"))),
                  ),flex: 1,):SizedBox()
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context,pos)=>Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black12)
                        )
                    ),
                    child: ListTile(
                      title: Text("Hazrat Sahajalal International Airport (DAC)"),
                      subtitle: Text("Bangladesh"),
                    ),
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
