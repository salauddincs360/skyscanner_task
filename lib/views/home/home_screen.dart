import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:skyscanner_task/res/colors/ColorsHelper.dart';
import 'package:skyscanner_task/views/search/multicity_screen.dart';
import 'package:skyscanner_task/views/search/one_way_screen.dart';
import 'package:skyscanner_task/views/search/roundtrip_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper().background_color,
      appBar: AppBar(
        backgroundColor: ColorsHelper().appbar_color,
        leading: Icon(Icons.close,size: 30,),
        elevation: 0,
      ),
      body: Container(
        color: ColorsHelper().appbar_color,
        child: ContainedTabBarView(
          tabs: [
            Text('ROUNDTRIP'),
            Text('ONE-WAY'),
            Text('MULTI-CITY'),
          ],
          tabBarProperties: TabBarProperties(
            indicatorColor: Colors.white,
            height: 35
          ),
          views: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: ColorsHelper().background_color,
              child:RoundTripScreen(),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: ColorsHelper().background_color,
              child:OneWayScreen(),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: ColorsHelper().background_color,
              child:MulticityScreen(),
            ),
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
