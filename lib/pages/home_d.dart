import 'package:flutter/material.dart';
import 'package:time_manager/PicsAndColors/colors.dart';

class Home_d extends StatefulWidget {
  @override
  _Home_dState createState() => _Home_dState();
}

class _Home_dState extends State<Home_d> {


  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: sunbotton(context),
        title: Text(
          'manage your time!',
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
            image: AssetImage('lib/PicsAndColors/night.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 300.0,
              margin: EdgeInsets.all(20),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Center(child: Text('Entry ${entries[index]}')),
                  );
                }
                ),
            ),
            RaisedButton(onPressed: (){
              setState(() {
                entries.add('m');
                colorCodes.add(100);
              });
            }
            ),
          ],
        ),
      ),
    );
  }
}

int c=0;



Widget sunbotton(context) => GestureDetector(
  onTap: (){
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  },
  child:   Container(
    padding: EdgeInsets.all(1),
    margin: EdgeInsets.all(7),
    decoration: BoxDecoration(shape: BoxShape.circle,color: Mycolors().secound,),
    child: Icon(
      Icons.lightbulb_outline,
      color: Mycolors().first,
      size: 33.0,
    ),
  ),
);