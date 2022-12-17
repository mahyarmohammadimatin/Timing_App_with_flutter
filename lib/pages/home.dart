import 'package:flutter/material.dart';
import 'package:time_manager/PicsAndColors/colors.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: nightbotton(context),
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
            image: AssetImage('lib/PicsAndColors/sun.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            RaisedButton.icon(onPressed: () {Navigator.pushNamed(context, '/test');}, icon: Icon(Icons.search), label: Text('this is test')),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cornometer');
              },
              child: Container(
                margin: EdgeInsets.all(30),
                color: Mycolors().secound,
                child: SizedBox(
                  width: 200.0,
                  height: 40.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/plans');
              },
              child: Container(
                margin: EdgeInsets.all(30),
                color: Mycolors().secound,
                child: SizedBox(
                  width: 200.0,
                  height: 40.0,
                ),
              ),
            ),
            Container(
              width: 150.0,
              color: Mycolors().first,
            ),
          ],
        ),
      ),
    );
  }
}

Widget nightbotton(context) => GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/home_d', (route) => false);
      },
      child: Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Mycolors().secound,
        ),
        child: Icon(
          IconData(0xe800, fontFamily: 'moon'),
          color: Mycolors().first,
          size: 33.0,
        ),
      ),
    );
