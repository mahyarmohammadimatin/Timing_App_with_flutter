import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_manager/PicsAndColors/colors.dart';

class Cornometer extends StatefulWidget {
  @override
  _CornometerState createState() => _CornometerState();
}

class _CornometerState extends State<Cornometer> {

  int hour=0,hourLap=0;
  int min=0,minLap=0;
  int sec=0,secLap=0;
  Timer mytimer;
  bool timing=false;
  List<String> laps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cornometer',
          style: TextStyle(
            color: Mycolors().secound,
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Mycolors().first,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/PicsAndColors/corbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Align(
              alignment: Alignment.center,
              child: show(hour,min,sec,90.0),
            ),
            show(hourLap,minLap,secLap,50.0),

            Container(
              color: Mycolors().first,
              height: 10,
              width: 250,
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
              height: 320.0,
              width: 150,
              //margin: EdgeInsets.all(20),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: laps.length,
                itemBuilder: (BuildContext context, int index) {
                  return cardmaker(laps[index]);
                }
                ),
            ),
            ),

            SizedBox(
              height: 10.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                chooseLeft(),
                SizedBox(width: 30,),
                chooseRight(),
              ],
            ),
            
          ],
        ),
      ),
    );
  }

Widget cardmaker(thislap) => Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Text(
    thislap,
    style: TextStyle(
      fontSize: 30.0,
      color: Mycolors().first,
    ),
  ),
);

  Widget show(hour,min,sec,size) => Text(
    '${(hour>9)? '': 0}$hour:${(min>9)? '': 0}$min:${(sec>9)? '': 0}$sec',
    style: TextStyle(
      color: Mycolors().first,
      fontSize: size,
    ),
  );


 Widget startButton() => RaisedButton(
    splashColor: Colors.pink[800],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    onPressed: () {
      if(timing) mytimer.cancel();
      timing=true;
      mytimer = Timer.periodic(Duration(seconds: 1), (mytimer){
      setState(() {
        sec++;
      if(sec==60){
        sec=0;
        min++;
      }
      if(min==60){
        min=0;
        hour++;
      }
      print(sec);
      });
    },
    );
    },
    child: Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text('Start! ', style: TextStyle(fontSize: 20,),),
    ),
    color: Colors.pink[900],
  );

Widget stopButton() => RaisedButton(
    onPressed: (){
      setState(() {
        timing=false;
        mytimer.cancel();
      });
    },
    child: Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text(' Pause ', style: TextStyle(fontSize: 20,),),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    color: Colors.pink[900],
  );

Widget resumeButton() => RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    onPressed: () {
      mytimer.cancel();
      timing=true;
      mytimer = Timer.periodic(Duration(seconds: 1), (mytimer){
      setState(() {
        sec++;
      if(sec==60){
        sec=0;
        min++;
      }
      if(min==60){
        min=0;
        hour++;
      }
      print(sec);
      });
    },
    );
    },
    child: Padding(
      padding: EdgeInsets.fromLTRB(30, 10,30, 10),
      child: Text('Resume ', style: TextStyle(fontSize: 20,),),
    ),
    color: Colors.pink[900],
  );

Widget restartButton() => RaisedButton(
  onPressed: (){
    setState(() {
      sec=0;secLap=0;
      min=0;minLap=0;
      hour=0;hourLap=0;
      mytimer.cancel();
      timing=false;
      laps.clear();
    });
  },
  child: Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text('Restart', style: TextStyle(fontSize: 20,),),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    color: Colors.pink[900],
);

Widget lapButton() => RaisedButton(
  onPressed: () {
    hourLap = hour;
    minLap = min;
    secLap = sec;
    List<String> helper = ['${(hourLap>9)? '': 0}$hourLap:${(minLap>9)? '': 0}$minLap:${(secLap>9)? '': 0}$secLap'];
    laps=helper + laps; 
  },
  child: Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Text('  Lap  ', style: TextStyle(fontSize: 20,)),
    ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
  color: Colors.pink[900],
);


Widget chooseLeft(){
  if(sec==0 && min==0 && hour==0 && !timing) return startButton();
  if(timing) return stopButton();
  return resumeButton();
}

Widget chooseRight(){
  if(timing) return lapButton();
  return restartButton();
}

Widget mylist() => Padding(
  padding: const EdgeInsets.all(20.0),
  child:   ListView(
    padding: const EdgeInsets.all(8),
    children: <Widget>[
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(child: Text('Entry A')),
      ),
    ],
  ),
);
}
