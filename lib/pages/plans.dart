import 'package:flutter/material.dart';
import 'package:time_manager/PicsAndColors/colors.dart';


List<Widget> planCards = [];

class Plans extends StatefulWidget {
  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plans',
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
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            
          height: 700.0,
          width: 700.0,
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: planCards.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(key: ValueKey('value'),
                child: planCards[index],
                background: Container(
                  height: 150.0,
                  width: 300.0,
                  color: Colors.green,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Done!',style: TextStyle(fontSize: 20.0,)),
                  ),
                ),
                secondaryBackground: Container(
                  height: 150.0,
                  width: 300.0,
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('unDone!',style: TextStyle(fontSize: 20.0,)),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    planCards.removeAt(index);
                  });
                },
              );
            }
            ),
        ),
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () {
          setState(() {
            planCards.add(AddPlan());
          });
        },
        child: Icon(Icons.note_add),
      ),
    );
  }
}

class AddPlan extends StatefulWidget {
  @override
  _AddPlanState createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {

  int cardNum = planCards.length;

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
     color: Mycolors().first,
  ),
  margin: EdgeInsets.all(10.0),
  padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
  height: 150.0,
  width: 380.0,
  child: Column(
    children: [
      Row(
        children: [
          Text(
            '$cardNum. ',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
              height: 65.0,
              width: 220.0,
              child: TextField(
              style: TextStyle(
                fontSize: 25.0,
              ),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText: 'plan title',
              )
            ),
            ),
          ),
        ],
      ),
      Align(
          alignment: Alignment.bottomLeft,
          child: Container(
          height: 70.0,
          width: 350.0,
          color: Colors.white,
          child: TextField(
            style: TextStyle(
              fontSize: 15.0,
            ),
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: 'write your plan...',
            )
          ),
        ),
      ),
    ],
  ),
);
  }
}