import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time/time.dart';
import 'dart:convert';

class Plan extends StatefulWidget {
  const Plan({Key key}) : super(key: key);

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  String plan = '';
  String awake = '';
  String drinkplan = '';
  String result1;
  var apt; //awake period per drinktimes
  var result2;
  var finale;
  double lpi; //litres per instance
  String waketime = '';
  int tenMinutes = 10.minutes.inSeconds;
  DateTime startTime = DateTime.now();
  var now;
  var result3;
  DateTime later;
  var multi;
  List<String> dataList;
  // DateTime inpm = DateTime.parse('startTime');
  // final DateTime inter;
  // DateTime nextinst = startTime + tenMinutes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 10, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: Builder(builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 2, 10),
            child: SafeArea(
                child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: Text('Water Daily Plan')),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 16,
                      child: Text('(Recommended plan is between 2.5 and 3.5L)'),
                    ),
                    buildPlan(),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 16,
                      child: Text('(Time spent from wake till bed time)'),
                    ),
                    buildAwake(),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 16,
                      child: Text('(Number of times you want to drink a day)'),
                    ),
                    buildDrinkplan(),
                    SizedBox(
                      height: 16,
                    ),
                    buildSubmit(),
                    SizedBox(
                      height: 66,
                    ),
                    buildResult(),
                    SizedBox(
                      height: 66,
                    ),
                    // buildStartplan(),
                    // SizedBox(height: 66),
                    buildResult23(),
                    SizedBox(height: 20),
                    // Container(
                    //   height: 40,
                    //   child: ListView.builder(
                    //     itemCount: dataList.length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return ListTile(
                    //         title: Text(dataList[index]),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // building(),
                  ]),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }

  Widget buildPlan() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Input your preferred plan',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) => setState(() => plan = value),
      );
  Widget buildAwake() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Hours spent awake throughout the day',
          border: OutlineInputBorder(),
        ),
        // keyboardType: TextInputType.emailAddress,
        onChanged: (value) => setState(() => awake = value),
      );
  Widget buildDrinkplan() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Preferred drink times',
          border: OutlineInputBorder(),
        ),
        // keyboardType: TextInputType.visiblePassword,
        onChanged: (value) => setState(() => drinkplan = value),
      );
  Widget buildSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepOrangeAccent, //buttoncolor
          onPrimary: Colors.white, //textcolor
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          minimumSize: Size(120.0, 50.0),
        ),
        onPressed: () {
          setState(() {
            lpi = double.parse(plan) / double.parse(drinkplan);
            result1 = lpi.toStringAsFixed(2);
            print(lpi);
            int intdrinkplan = int.parse(drinkplan);

            apt = double.parse(awake) / double.parse(drinkplan);
            print(apt);
            result2 = apt.toStringAsFixed(0);
            int result23 = int.parse(result2);
            startTime = DateTime.now();
            print(startTime);
            // later = startTime.add(Duration(hours: result23));
            multi = startTime.add(Duration(hours: result23));
            for (var i = 1; i < intdrinkplan; i++) {
              multi = multi.add(Duration(hours: result23));
              print(multi);
            }
            ;

            // for (var i = 1; i < intdrinkplan; i++) {
            //   dataList = multi.add(Duration(hours: result23));
            //   // DateTime.parse(dataList[].toString());
            //   print(dataList);
            // }
            // ;

            // inpm = DateTime.parse('startTime');
          });
        },
        child: Text('See details'),
      );
  Widget buildResult() => Column(
        children: [
          Text('Water volume/drink times =  *** $result1 *** L/instance'),
          SizedBox(
            height: 20,
          ),
          Text('Number of hours awake/drink times = \n From time awake, drink '
              '$result1 L'
              ' of water with interval of *** $result2 *** hrs'),
          SizedBox(
            height: 20,
          ),
          Text('$startTime'),
          Text('$multi'),
        ],
      );
  Widget buildResult23() => Column(
        children: [
          Text('$startTime'),
          Text(
              'The daily plan has started, you will be alerted in the next $result2 hrs'),
          // Text('$nextinst'),
        ],
      );

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
  Widget buildStartplan() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepOrangeAccent, //buttoncolor
          onPrimary: Colors.white, //textcolor
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          minimumSize: Size(120.0, 50.0),
        ),
        onPressed: () {
          setState(() {
            lpi = double.parse(plan) / double.parse(drinkplan);
            result1 = lpi.toStringAsFixed(2);
            print(lpi);

            apt = double.parse(awake) / double.parse(drinkplan);
            print(apt);
            result2 = apt.toStringAsFixed(1);

            var now = new DateTime.now();
            var result3 = int.parse(result2);
            final DateTime inter = result3.hours.fromNow;
            var nextinst = startTime.add(new Duration(hours: result3));

            print(startTime);
            print(nextinst);
          });
        },
        child: Text('Start daily plan'),
      );
  Widget buildResult2() => Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white, //buttoncolor
              onPrimary: Colors.green, //textcolor
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              minimumSize: Size(120.0, 50.0),
            ),
            onPressed: () {
              setState(() {
                lpi = double.parse(plan) / double.parse(drinkplan);
                result1 = lpi.toStringAsFixed(2);
                // print(lpi);

                apt = double.parse(awake) / double.parse(drinkplan);
                // print(apt);
                result2 = apt.toStringAsFixed(1);

                var now = new DateTime.now();
                var result3 = int.parse(result2);
                final DateTime inter = result3.hours.fromNow;
                // final DateTime startTime = DateTime.now();
                var nextinst = startTime.add(new Duration(hours: result3));

                // print(startTime);
                // print(nextinst);
                finale = Column(
                  children: [
                    Text(
                        'The daily plan has started, you will be alerted in the next $result2 hrs'),
                    Text('$startTime'),
                    Text('$nextinst'),
                    Text('$now'),
                  ],
                );
              });
            },
            child: Column(
              children: [
                Text(
                    'The daily plan has started, you will be alerted in the next $result2 hrs'),
                Text('$startTime'),
                // Text('$nextinst'),
                Text('$now'),
              ],
            ),
          ),
          // Text(
          //     'The daily plan has started, you will be alerted in the next $result2 hrs'),
          // Text('$startTime'),
          // Text('$nextinst'),
          // Text('$now'),
        ],
      );
  Widget building() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green, //buttoncolor
          onPrimary: Colors.white, //textcolor
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          minimumSize: Size(120.0, 50.0),
        ),
        onPressed: () {
          setState(() {
            lpi = double.parse(plan) / double.parse(drinkplan);
            result1 = lpi.toStringAsFixed(2);
            print(lpi);

            apt = double.parse(awake) / double.parse(drinkplan);
            print(apt);
            result2 = apt.toStringAsFixed(1);

            var now = DateTime.now();
            var result3 = int.parse(result2);
            final DateTime inter = result3.hours.fromNow;
            var nextinst = startTime.add(new Duration(hours: result3));

            print(startTime);
            print(nextinst);
          });
        },
        child: Text('Start daily plan'),
      );
}
